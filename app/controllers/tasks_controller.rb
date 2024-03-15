class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = policy_scope(Task)
    authorize Task

    @tasks = if current_user.admin? && params[:view_option] == 'mine'
               @tasks.joins(:user_tasks).where(user_tasks: { user_id: current_user.id }).order(:deadline)
             elsif current_user.admin?
               @tasks.order(:deadline)
             else
               @tasks.joins(:user_tasks).where(user_tasks: { user_id: current_user.id }).order(:deadline)
             end

    @tasks = @tasks.where(priority: params[:priority]) if params[:priority].present?

    case params[:completed]
    when 'true'
      @tasks = @tasks.where(completed: true)
    when 'false'
      @tasks = @tasks.where(completed: false)
    end
  end


  def show
    @task = Task.includes(user_tasks: :user, task_comments: :user).find(params[:id])
    authorize @task

  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end

  def update
    @task = Task.find(params[:id])
    authorize @task
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      flash.now[:alert] = @task.errors.full_messages.join(', ')
      render :edit
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end

  def destroy
    @task = Task.find(params[:id])
    authorize @task
    if @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully deleted.'
    else
      redirect_to task_path(@task), alert: 'Error deleting task.'
    end
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task

    if @task.deadline && @task.deadline < Time.current
      flash.now[:alert] = "Deadline must be in the future."
      render :new and return
    end

    user_ids = Array(params[:user_ids]).reject(&:blank?).map(&:to_i).select { |id| id > 0 }
    if user_ids.empty?
      flash.now[:alert] = "At least one user must be assigned to the task."
      render :new and return
    else
      @task.users = User.where(id: user_ids)
    end

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def toggle_completion
    @task = Task.find(params[:id])
    Rails.logger.debug "Received params: #{params.inspect}"
    @task.completed = params[:completed].present? && params[:completed].to_s == "true"
    authorize @task

    if @task.save
      respond_to do |format|
        format.json { head :no_content }
        format.html { redirect_to @task, notice: 'Task updated.' }
      end
    else
      respond_to do |format|
        format.json { render json: { error: "Unable to update task." }, status: :unprocessable_entity }
        format.html { redirect_to @task, alert: 'Unable to update task.' }
      end
    end
  end

  def add_user
    @task = Task.find(params[:id])
    authorize @task
    @user = User.find(params[:user_id])
    @task.users << @user unless @task.users.include?(@user)
    redirect_to task_path(@task), notice: "User added successfully."
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :priority, user_ids: [])
  end
end

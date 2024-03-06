class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.order(:deadline)
    @tasks = @tasks.where(priority: params[:priority]) if params[:priority].present?
  end

  def show
    @task = Task.includes(user_tasks: :user, task_comments: :user).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end

  def update
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def toggle_completion
    @task = current_user.tasks.find(params[:id])
    @task.completed = !@task.completed
    if @task.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back(fallback_location: task_path(@task), notice: 'Task status updated.') }
      end
    else
      redirect_back(fallback_location: task_path(@task), alert: 'Unable to update task.')
    end
  end

  def add_user
    @task = Task.find(params[:id])
    @user = User.find(params[:user_id])
    @task.users << @user unless @task.users.include?(@user)
    redirect_to task_path(@task), notice: "User added successfully."
  end

  def remove_user_from_task
    user_task = UserTask.find_by(task_id: params[:id], user_id: params[:user_id])
    if user_task&.destroy
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("task_users", partial: "tasks/task_users", locals: { task: user_task.task })
        end
        format.html { redirect_to task_path(user_task.task), notice: "User removed from task." }
      end
    else
      respond_to do |format|
        format.html { redirect_to task_path(params[:id]), alert: "Failed to remove user from task." }
        task = Task.find_by(id: params[:id])
        if task
          format.turbo_stream { render turbo_stream: turbo_stream.replace("task_users", partial: "tasks/task_users", locals: { task: task }) }
        else
          format.turbo_stream { render turbo_stream: turbo_stream.append("errors", "Task not found.") }
        end
      end
    end
  end



  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :priority, user_ids: [])
  end
end

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
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def mark_complete
    Task.where(id: params[:tasks]).update_all(completed: true)
    redirect_to tasks_path, notice: "Tasks marked as complete."
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end

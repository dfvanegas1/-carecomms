class TasksController < ApplicationController
  before_action :set_user

  def index
    @tasks = @user.tasks
  end

  def show
    @task = Task.includes(user_tasks: :user).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: 'Task not found.'
  end

  def update
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline)
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end

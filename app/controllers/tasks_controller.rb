class TasksController < ApplicationController
  def index
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
end

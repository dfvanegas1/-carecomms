class UserTasksController < ApplicationController
  before_action :set_user_task, only: [:destroy]

  def destroy
    @task = @user_task.task
    authorize @user_task
    @user_task.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("task_users", partial: "tasks/task_users", locals: { task: @task }) }
      format.html { redirect_to task_path(@task), notice: "User removed successfully." }
    end
  end

  private

  def set_user_task
    @user_task = UserTask.find(params[:id])
  end
end

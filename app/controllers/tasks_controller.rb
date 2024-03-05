class TasksController < ApplicationController
  before_action :set_user

  def index
    @tasks = @user.tasks
  end

  def show
  end

  def update
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end
end

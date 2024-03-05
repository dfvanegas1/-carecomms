class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @tasks = Task.all
    @users = User.all
    @users_on_shift = Shift.current_shift_users
    @tasks_priority = current_user.tasks.order(:deadline).where(priority: '3').count
  end

  def team
    @users = User.all
    @users_on_shift = Shift.current_shift_users
    @users_out_today = Shift.out_today_users
  end

  def profile
    @user = User.find(params[:id])
  end
end

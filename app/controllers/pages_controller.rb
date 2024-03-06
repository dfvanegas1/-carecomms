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
    if params[:query].present?
      @users_on_shift = @users_on_shift.where("first_name ILIKE ?", "%#{params[:query]}%")
    end
    @users_out_today = Shift.out_today_users
    if params[:query].present?
      @users_out_today = @users_out_today.where("first_name ILIKE ?", "%#{params[:query]}%")
    end

  end

  def profile
    @user = User.find(params[:id])
  end
end

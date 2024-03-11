class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @tasks = Task.all
    @users = User.all
    @users_on_shift = Shift.current_shift_users

    if current_user.admin?
      @tasks_priority = Task.where(priority: '3').count
    else
      @tasks_priority = current_user.tasks.where(priority: '3').count
    end

    @total_mentions = MentionComment.where(user: current_user).count + MentionMessage.where(user: current_user).count
  end

  def team
    @users = User.all
    @users_on_shift = Shift.current_shift_users
    @users_on_shift = @users_on_shift.where("first_name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @users_out_today = Shift.out_today_users
    @users_out_today = @users_out_today.where("first_name ILIKE ?", "%#{params[:query]}%") if params[:query].present?
  end

  def profile
    @user = User.find(params[:id])
    @shifts = @user.shifts
    @tasks = @user.tasks.order(:deadline)
    @tasks = @tasks.where(priority: params[:priority]) if params[:priority].present?
  end

  def calendar
    @tasks = policy_scope(Task)
    authorize Task
    @user_shifts = UserShift.all
  end
end

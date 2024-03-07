class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @tasks = Task.all
    @users = User.all
    @users_on_shift = Shift.current_shift_users
    @tasks_priority = current_user.tasks.order(:deadline).where(priority: '3').count
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
    @events = @user_shifts.map do |shift|
                OpenStruct.new(
                  start_time: shift.shift.start_date,
                  end_time: shift.shift.end_date,
                  model: shift,
                  type: :shift,
                  avatar: shift.user.avatar
                )
              end +
                @tasks.map do |task|
                  OpenStruct.new(
                    start_time: task.deadline,
                    model: task,
                    type: :task,
                    title: task.title
                )
              end
  end
end

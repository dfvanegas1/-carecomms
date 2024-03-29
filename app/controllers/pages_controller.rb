class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @tasks = Task.all
    @users = User.all
    @users_on_shift = Shift.current_shift_users

    if params[:started_shift]
      flash[:notice] = 'You successfully started your shift.'
    end

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

  def start_shift
    render layout: 'start_shift'
  end

  def profile
    @user = User.find(params[:id])
    @shifts = @user.shifts
    @tasks = @user.tasks.order(:deadline)
    @tasks = @tasks.where(priority: params[:priority]) if params[:priority].present?
  end

  def calendar
    @all_tasks = policy_scope(Task)
    @my_tasks = @all_tasks.joins(:user_tasks).where(user_tasks: { user_id: current_user.id })

    @all_shifts = Shift.all
    @user_shifts = UserShift.where(user: current_user).map(&:shift)

    authorize Task
  end
end

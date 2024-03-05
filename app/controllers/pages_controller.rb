class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @tasks = Task.all
    @users = User.all
  end

  def team
    @users = User.all
    @users_on_shift = Shift.current_shift_users
    @users_out_today = Shift.out_today_users
  end

  def profile
  end
end

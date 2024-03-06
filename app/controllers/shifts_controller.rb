class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift
  before_action :set_user_from_profile

  def update
    @shift.update(shift_params)
    redirect_to profile_path(@user)
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:start_date, :end_date)
  end

  def set_user_from_profile
    @user = User.find(params[:shift][:user_id].to_i)
  end
end

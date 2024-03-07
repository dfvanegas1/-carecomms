class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift
  before_action :set_user_from_profile

  def update
    @user_shift = UserShift.find_by(shift_id: @shift.id, user_id: @user.id)
    authorize @user_shift
    @user_shift.update(shift_id: params[:shift][:id])
    redirect_to profile_path(@user)
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:id, :user_id)
  end

  def set_user_from_profile
    @user = User.find(params[:shift][:user_id])
  end
end

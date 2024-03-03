# app/controllers/shifts_controller.rb
class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]
  before_action :set_shift, only: [:update]

  def update
    if @shift.update(shift_params)
      redirect_to profile_path(id: @user.id), notice: 'Shift was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_shift
    @shift = @user.shifts.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:start_date, :end_date)
  end
end

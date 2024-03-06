class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:update]

  def update
    if @shift.update(shift_params)
      respond_to do |format|
        format.html { redirect_to profile_path(id: @user.id), notice: 'Shift was successfully updated.' }
        format.json { render json: { message: 'Shift updated successfully', shift: @shift }, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:start_date, :end_date)
  end
end

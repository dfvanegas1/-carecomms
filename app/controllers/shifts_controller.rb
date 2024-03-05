class ShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shift, only: [:update]
  before_action :set_user_from_profile, only: [:update]
  before_action :authorize_shift_update, only: [:update]

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

  def set_user_from_profile
    # This sets @user based on the profile being visited
    @user = User.find(params[:user_id])
  end

  def authorize_shift_update
    unless can_edit_shifts_for?(@user) || current_user.admin?
      redirect_to root_path, alert: "You're not authorized to edit this shift."
    end
  end

  def can_edit_shifts_for?(user)
    # Your custom logic here. This example assumes you might check if the current_user is an admin,
    # or if the current_user is part of the same team or has specific permissions to edit shifts for the visited user.
    current_user.admin? || current_user == user || current_user.has_permission?(:edit_shifts, for: user)
  end
end

class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  def start_time
    self.shift.start_date
  end

  # def end_time
  #   self.shift.end_date
  # end
end

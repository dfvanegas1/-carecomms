class Shift < ApplicationRecord
  has_many :user_shifts, dependent: :destroy
  has_many :users, through: :user_shifts

  def self.current_shift_users
    User.joins(user_shifts: :shift)
        .where("shifts.start_date <= ? AND shifts.end_date >= ?", DateTime.now, DateTime.now)
        .select('users.*')
  end

  def self.out_today_users
    User.where.not(
      id: UserShift.joins(:shift)
                   .where('? BETWEEN shifts.start_date AND shifts.end_date', DateTime.now)
                   .select(:user_id)
    )
  end

  def shift_info
    "#{start_date.strftime('%d-%m-%Y %H:%M')} to #{end_date.strftime('%d-%m-%Y %H:%M')}"
  end

  def start_time
    start_date
  end

  def end_time
    end_date
  end
end

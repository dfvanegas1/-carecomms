class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :shift
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"


  def start_time
    self.shift.start_date
  end

  # def end_time
  #   self.shift.end_date
  # end
end

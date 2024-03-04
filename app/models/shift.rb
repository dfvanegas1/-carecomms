class Shift < ApplicationRecord
  has_many :user_shifts, dependent: :destroy
end

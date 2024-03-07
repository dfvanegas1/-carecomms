class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mesasges
  has_many :task_comments
  has_many :user_shifts
  has_many :shifts, through: :user_shifts
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_many :mention_comments
  has_many :mention_messages
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end
end

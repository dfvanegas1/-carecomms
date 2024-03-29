class Task < ApplicationRecord
  has_many :task_comments, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  enum priority: { high: 3, medium: 2, low: 1 }
  validate :deadline_must_be_in_the_future, if: -> { deadline.present? && deadline_changed? }
  after_save :parse_mentions

  def start_time
    deadline
  end

  private

  def parse_mentions
    mentioned_names = description.scan(/@(\w+)/).flatten
    mentioned_users = User.where(first_name: mentioned_names)

    mentioned_users.each do |user|
      puts "Notify #{user.first_name}"
    end
  end

  def deadline_must_be_in_the_future
    if deadline < Time.current
      errors.add(:deadline, "must be in the future")
    end
  end
end

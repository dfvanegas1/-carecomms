class Task < ApplicationRecord
  has_many :task_comments, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  # validates :priority, inclusion: { in: 0..3 }, allow_nil: true
  enum priority: { high: 3, medium: 2, low: 1, unspecified: 0 }
  after_save :parse_mentions

  private

  def parse_mentions
    # Regex to find @ followed by word characters
    mentioned_names = description.scan(/@(\w+)/).flatten
    mentioned_users = User.where(first_name: mentioned_names)

    mentioned_users.each do |user|
      # Example: Notify the mentioned user
      # This depends on your notification logic
      puts "Notify #{user.first_name}"
    end
  end
end

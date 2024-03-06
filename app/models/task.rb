class Task < ApplicationRecord
  has_many :task_comments, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  # validates :priority, inclusion: { in: 0..3 }, allow_nil: true
  enum priority: { high: 3, medium: 2, low: 1, unspecified: 0 }
end

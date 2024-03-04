class Task < ApplicationRecord
  has_many :task_comments, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
end

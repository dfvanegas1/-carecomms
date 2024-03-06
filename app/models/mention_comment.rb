class MentionComment < ApplicationRecord
  belongs_to :user
  belongs_to :task_comment
end

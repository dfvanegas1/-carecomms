class MentionComment < ApplicationRecord
  belongs_to :user
  belongs_to :task_comment
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"
end

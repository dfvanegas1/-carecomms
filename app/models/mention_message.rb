class MentionMessage < ApplicationRecord
  belongs_to :user
  belongs_to :message
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"
end

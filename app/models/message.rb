class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_many :mention_messages, dependent: :destroy
  after_save :create_mentions

  private

  def create_mentions
    mentioned_names = self.content.scan(/@(\w+)/).flatten

    mentioned_names.each do |name|
      user = User.find_by(first_name: name)
      next unless user

      MentionMessage.create(user: user, message: self)
    end
  end
end

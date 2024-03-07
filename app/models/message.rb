class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_many :mention_messages, dependent: :destroy
  after_save :create_mentions

  private

  def create_mentions
    # Regex to match @ followed by word characters
    mentioned_names = self.content.scan(/@(\w+)/).flatten

    mentioned_names.each do |name|
      # Assuming User model has a 'first_name' field used for mentions
      user = User.find_by(first_name: name)
      next unless user

      # Create MentionMessage record
      MentionMessage.create(user: user, message: self)
    end
  end
end

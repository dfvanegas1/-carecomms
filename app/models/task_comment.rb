class TaskComment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :mention_comments, dependent: :destroy
  after_save :create_mentions

  private

  def create_mentions
    # Regex to match @ followed by word characters
    mentioned_names = self.content.scan(/@(\w+)/).flatten

    mentioned_names.each do |name|
      # Assuming User model has a 'first_name' field used for mentions
      user = User.find_by(first_name: name)
      next unless user

      # Create MentionComment record
      MentionComment.create(user: user, task_comment: self)
    end
  end
end

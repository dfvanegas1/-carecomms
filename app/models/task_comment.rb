class TaskComment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :mention_comments, dependent: :destroy
  has_one_attached :file
  after_save :create_mentions

  private

  def create_mentions
    # Regex to match @ followed by word characters
    mentioned_names = self.content.scan(/@(\w+)/).flatten.map(&:downcase)
    mentioned_names.each do |name|
      # Assuming User model has a 'first_name' field used for mentions
      user = User.where('LOWER(first_name) = ?', name).first
      next unless user

      MentionComment.create(user: user, task_comment: self)
    end
  end
end

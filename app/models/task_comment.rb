class TaskComment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :mention_comments, dependent: :destroy
  after_save :create_mentions

  private

  def create_mentions
    mentioned_names = self.content.scan(/@(\w+)/).flatten

    mentioned_names.each do |name|
      user = User.find_by(first_name: name)
      next unless user

      MentionComment.create(user: user, task_comment: self)
    end
  end
end

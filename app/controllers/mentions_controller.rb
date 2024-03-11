# app/controllers/mentions_controller.rb
class MentionsController < ApplicationController
  before_action :authenticate_user!

  def index
    mention_comments = MentionComment.where(user: current_user)
    mention_messages = MentionMessage.where(user: current_user)
    updated_shifts = current_user.shifts.count # Adjust this based on your application logic

    @mention_comments_count = mention_comments.count
    @mention_messages_count = mention_messages.count
    @updated_shifts_count = updated_shifts
    @total_mentions = @mention_comments_count + @mention_messages_count + @updated_shifts_count

    @mention_comments = mention_comments # This is for iteration
    @mention_messages = mention_messages # This is for iteration
  end
end

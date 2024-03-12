# app/controllers/mentions_controller.rb
class MentionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mention_comments = MentionComment.where(user: current_user)
    @mention_messages = MentionMessage.where(user: current_user)
  end
end

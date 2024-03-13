# app/controllers/mentions_controller.rb
class MentionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.includes(event: :record)
  end
end

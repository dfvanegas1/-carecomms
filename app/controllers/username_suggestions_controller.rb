# app/controllers/username_suggestions_controller.rb
class UsernameSuggestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:query].downcase
    users = User.where('LOWER(first_name) LIKE ?', "#{query}%").limit(5)
    render json: users.pluck(:first_name)
  end
end

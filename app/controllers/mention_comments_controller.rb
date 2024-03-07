class MentionCommentsController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in; adjust based on your authentication setup

  def create
    @mention_comment = MentionComment.new(mention_comment_params)

    if @mention_comment.save
      # Handle the success scenario, such as redirecting to the commented task or rendering a partial
      redirect_to some_path, notice: 'Mention successfully created.'
    else
      # Handle failure, such as re-rendering the form or returning an error message
      render 'some_form', alert: 'Failed to create mention.'
    end
  end

  private

  # Strong parameters method to ensure safe assignment of attributes
  def mention_comment_params
    params.require(:mention_comment).permit(:user_id, :task_comment_id)
  end
end

class MentionCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @mention_comment = MentionComment.new(mention_comment_params)

    if @mention_comment.save
      NewMentionNotifier.with(record: @mention_comment).deliver(@mention_comment.user)
      redirect_to some_path, notice: 'Mention successfully created.'
    else
      render 'some_form', alert: 'Failed to create mention.'
    end
  end

  private

  def mention_comment_params
    params.require(:mention_comment).permit(:user_id, :task_comment_id)
  end
end

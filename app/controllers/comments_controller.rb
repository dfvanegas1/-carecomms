class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = Comment.new(comment_params)
    @comment.task_id = params[:task_id]
    @comment.user_id = current_user.id # Assuming you have a current_user method

    # if @comment.save
    #   redirect_to task_path(@comment.task_id), notice: 'Comment was successfully added.'
    # else
    #   # Handle the case where comment can't be saved
    #   # This might involve rendering the task's show view again with error messages
    #   redirect_to task_path(@comment.task_id), alert: 'Error adding comment.'
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :task_id)
  end

end

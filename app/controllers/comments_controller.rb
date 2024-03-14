class CommentsController < ApplicationController
  before_action :set_task

  def create
    Rails.logger.debug "Submitted params: #{params.inspect}"
    @comment = @task.task_comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        @comment.mention_comments.each do |mention|
          NewMentionNotifier.with(record: mention).deliver(mention.user)
        end
        format.turbo_stream
        format.html { redirect_to @task }
      else
        format.html { render 'tasks/show', status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:task_comment).permit(:content, :file)
  end
end

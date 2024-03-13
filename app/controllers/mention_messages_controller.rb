class MentionMessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @mention_message = MentionMessage.new(mention_message_params)

    if @mention_message.save
      NewMentionNotifier.with(record: @mention_message).deliver(@mention_message.user)

      redirect_to some_path, notice: 'Mention successfully created.'
    else
      render 'some_form', alert: 'Failed to create mention.'
    end
  end

  private

  def mention_message_params
    params.require(:mention_message).permit(:user_id, :message_id)
  end
end

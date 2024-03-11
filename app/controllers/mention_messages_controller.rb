class MentionMessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @mention_message = MentionMessage.new(mention_message_params)

    if @mention_message.save
      ActionCable.server.broadcast "mentions_channel#{mentioned_user_id}",
      mention: render_mention(@mention_message)
      redirect_to some_path, notice: 'Mention successfully created.'
    else
      render 'some_form', alert: 'Failed to create mention.'
    end
  end

  private

  def mention_message_params
    params.require(:mention_message).permit(:user_id, :message_id)
  end

  def render_mention(mention_message)
    ApplicationController.renderer.render(partial: 'mention_messages/mention', locals: { mention_message: mention_message })
  end
end

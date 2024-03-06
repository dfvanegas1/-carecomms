class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(7)
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end

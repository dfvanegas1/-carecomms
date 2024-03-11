class MentionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "mentions_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

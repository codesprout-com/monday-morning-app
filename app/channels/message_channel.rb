class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "main_room"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

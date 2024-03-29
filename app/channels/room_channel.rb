class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data["message"])
    ActionCable.server.broadcast(
      "room_channel", { message: render_message(message) }
    )
  end

  private

  def render_message(message)
    p message
    ApplicationController.render(
      partial: "messages/message",
      locals: { message: message }
    )
  end
end

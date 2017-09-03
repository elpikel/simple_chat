defmodule Chat do
  def simulate do
    Chat.ChatSupervisor.start_link()

    Chat.RoomsSupervisor.create_room(:test2)
    Chat.Participant.start(:u1)
    Chat.Participant.start(:u2)

    Chat.Room.join(:test2, :u1)
    Chat.Room.join(:test2, :u2)

    # message = %Chat.Message{text: "Hello u2, are you there?", from: :u1, to: :u2}
    # Chat.Room.send(:test, message)
    #
    # message = %Chat.Message{text: "Hello u1, sure!", from: :u2, to: :u1}
    # Chat.Room.send(:test, message)
  end
end

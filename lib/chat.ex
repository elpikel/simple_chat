defmodule Chat do
  @moduledoc """
  Documentation for Chat.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chat.hello
      :world

  """
  def simulate do
    Chat.Room.start(:test)
    Chat.Participant.start(:u1)
    Chat.Participant.start(:u2)

    Chat.Room.join(:test, :u1)
    Chat.Room.join(:test, :u2)

    message = %Chat.Message{text: "Hello u2, are you there?", from: :u1, to: :u2}
    Chat.Room.send(:test, message)

    message = %Chat.Message{text: "Hello u1, sure!", from: :u2, to: :u1}
    Chat.Room.send(:test, message)
  end
end

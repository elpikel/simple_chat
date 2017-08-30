defmodule Chat.Room do
  use GenServer

  def start(name) do
    GenServer.start_link(__MODULE__, MapSet.new(), name: name)
  end

  def init(participants) do
    {:ok, participants}
  end

  def join(name, participant) do
    GenServer.cast(name, {:join, participant})
  end

  def send(name, message) do
    GenServer.cast(name, {:send, message})
  end

  def handle_cast({:send, message}, participants) do
    participants
    |> Enum.each(fn(participant) ->
      if participant != message.to do
         Chat.Participant.send(message)
      end
    end)

    {:noreply, participants}
  end

  def handle_cast({:join, participant}, participants) do
    participants = MapSet.put(participants, participant)

    {:noreply, participants}
  end
end

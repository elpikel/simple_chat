defmodule Chat.Room do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, MapSet.new(), name: name)
  end

  def init(participants) do
    {:ok, participants}
  end

  def join(name, participant) do
    GenServer.cast(name, {:join, participant})
  end

  def handle_cast({:join, participant}, participants) do
    participants = MapSet.put(participants, participant)
    IO.puts("new participant: #{participant}")
    {:noreply, participants}
  end
end

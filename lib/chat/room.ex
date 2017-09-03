defmodule Chat.Room do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  def init(name) do
    {:ok, Chat.Cache.get_participants(name)}
  end

  def handle_info({:started, name}, _) do
    participants = Chat.Cache.get_participants(name)

    {:noreply, participants}
  end

  def join(name, participant) do
    GenServer.cast(name, {:join, participant})
  end

  def handle_cast({:join, participant}, participants) do
    participants = [participant | participants]
    IO.puts("new participant: #{participant}")
    {:noreply, participants}
  end
end

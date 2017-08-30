defmodule Chat.Participant do
  use GenServer

  def start(name) do
    GenServer.start(__MODULE__, [], name: name)
  end

  def send(message) do
    GenServer.cast(message.to, {:send, message})
  end

  def handle_cast({:send, message}, []) do
    IO.puts("message from: #{message.from}")
    IO.puts(message.text)

    {:noreply, []}
  end
end

defmodule Chat.Cache do
    use GenServer

    def start_link() do
        {:ok, pid} = GenServer.start_link(__MODULE__, %{}, name: :chat_server)
        pid
    end

    def init(participants) do
        {:ok, participants}
    end

    def store_participant(participant, room) do
        GenServer.cast(:chat_server, {:store, room, participant})
    end

    def get_participants(room) do
        GenServer.call(:chat_server, {:get, room})
    end

    def handle_cast({:store, room, participant}, participants) do
         updated_participants = Map.update(participants, room, [participant], fn(room_participants) -> [participant | room_participants]end)
         {:noreply, updated_participants}
    end

    def handle_call({:get, room}, _from, participants) do
        room_participants = Map.get(participants, room, [])
        {:reply, room_participants, participants}
    end
end
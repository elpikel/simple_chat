defmodule Chat.ChatSupervisor do
    use Supervisor

    def start_link() do
        {:ok, supervisor} = Supervisor.start_link(__MODULE__, [], name: :chat_supervisor)
        
        start_workers(supervisor)

        supervisor
    end

    def start_workers(supervisor) do
        Supervisor.start_child(supervisor, worker(Chat.Cache, []))
        Supervisor.start_child(supervisor, supervisor(Chat.RoomsSupervisor, []))    
    end

    def init(_) do  
        supervise([], strategy: :one_for_one)
    end
end
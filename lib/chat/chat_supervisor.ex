defmodule Chat.ChatSupervisor do
    use Supervisor

    def start_link() do
        {:ok, supervisor} = Supervisor.start_link(__MODULE__, [], name: :chat_supervisor)
        supervisor
    end

    def init(_args) do
        worker_opts = [restart: :permanent, funtion: :start_linik]
        children = [
            worker(Chat.RoomsSupervisor, [], worker_opts),
            worker(Chat.Cache, [], worker_opts)
        ]
        opts = [strategy: :simple_one_for_one, max_restarts: 5, max_seconds: 5]
        supervise(children, opts)
    end

    def start_child() do
        Supervisor.start_child(:chat_supervisor, [])
    end
end
defmodule Chat.RoomsSupervisor do
  use Supervisor

  def start_link() do
    {:ok, supervisor} = Supervisor.start_link(__MODULE__, [], name: :rooms_supervisor)
    supervisor
  end

  def init(_args) do
    worker_opts = [restart: :permanent, function: :start_link]
    children = [worker(Chat.Room, [], worker_opts)]
    opts = [strategy: :simple_one_for_one, max_restarts: 5, max_seconds: 5]
    supervise(children, opts)
  end

  def create_room(room_name) do
    Supervisor.start_child(:rooms_supervisor, [room_name])
  end
end

defmodule CacheTest do
    use ExUnit.Case

    test "should store participants in room" do
        room = "test room"
        Chat.Cache.start_link()

        Chat.Cache.store_participant("participant 1", room)
        Chat.Cache.store_participant("participant 2", room)

        participants = Chat.Cache.get_participants(room)

        assert participants == ["participant 2", "participant 1"]
    end
end
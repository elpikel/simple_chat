defmodule Chat.Message do
  @enforce_keys [:text, :from, :to]
  defstruct [:text, :from, :to]
end

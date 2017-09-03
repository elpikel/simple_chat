defmodule Chat.Message do
  @enforce_keys [:text, :from]
  defstruct [:text, :from]
end

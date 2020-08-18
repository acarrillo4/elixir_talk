defmodule DiDemo.Tortilla do
  @moduledoc """
  Module to work with tortillas
  """
  alias DiDemo.Tortilla
  defstruct type: nil, warm: false

  @valid_types ["corn", "flour"]

  @doc """
  Warms up a tortilla, returns a %Tortilla{} struct.

  Example:
  iex> DiDemo.Tortilla.warm_up("corn")
  > %Tortilla{type: "corn", warm: true}
  """
  def warm_up(type) when type in @valid_types do
    %Tortilla{type: type, warm: true}
  end

  def warm_up("hard shell" = type), do: {:error, "Sorry, #{type} is not a real tortilla type. That's just disrespectful"}

  def warm_up(type), do: {:error, "Sorry, we don't have #{type} tortillas"}
end

defmodule DiDemo.Tortilla do
  @moduledoc """
  Module to work with tortillas
  """

  alias DiDemo.Tortilla

  defstruct type: nil,
            warm: false

  @valid_types ["corn", "flour"]

  @doc """
  Given a valid tortilla type, it warms up the tortilla and returns a %Tortilla{} struct.
  Returns error tuple {:error, message} otherwise.

  ## Examples:
      iex> DiDemo.Tortilla.warm_up("corn")
      %Tortilla{type: "corn", warm: true}

      iex> DiDemo.Tortilla.warm_up("cauliflower")
      {:error, "Sorry, we don't have cauliflower tortillas"}
  """
  def warm_up(type) when type in @valid_types do
    %Tortilla{type: type, warm: true}
  end

  def warm_up("hard shell" = type), do: {:error, "Sorry, #{type} is not a real tortilla type. That's just disrespectful"}

  def warm_up(type), do: {:error, "Sorry, we don't have #{type} tortillas"}
end

defmodule DiDemo.Tortilla do
  alias DiDemo.Tortilla
  defstruct type: nil, warm: false

  @valid_types ["corn", "flour"]

  @doc """
  Warms up a tortilla, returns a %Tortilla{} struct.
  """
  def warm_up(type) when type in @valid_types do
    %Tortilla{type: type, warm: true}
  end

  def warm_up(type), do: {:error, "Sorry, #{type} is not a real tortilla type. That's just disrespectful"}
end

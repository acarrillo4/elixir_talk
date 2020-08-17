defmodule DiDemo.Base do
  alias DiDemo.Base

  defstruct type: nil

  @valid_bases ["asada", "pastor", "fajitas", "veggies"]

  def add(type) when type in @valid_bases do
    %Base{type: type}
  end

  def add(type), do: {:error, "Sorry, #{type} is not a base"}
end

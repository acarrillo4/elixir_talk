defmodule DiDemo.Salsa do
  alias DiDemo.Salsa
  defstruct type: nil, spice: nil

  @valid_types ["green", "red"]
  @valid_spice ["mild", "hot", "melt_your_face"]

  def add("none") do
    %Salsa{}
  end

  def add(type) when type in @valid_types do
    %Salsa{type: type, spice: "mild"}
  end

  def add(_type) do
    %Salsa{type: "green", spice: "mild"}
  end

  def add(type, spice) do
    add(type)
    |> add_spice(spice)
  end

  defp add_spice(%Salsa{} = salsa, spice) when spice in @valid_spice do
    salsa
    |> Map.replace!(:spice, spice)
  end

  defp add_spice(%Salsa{} = salsa, _spice) do
    salsa
    |> Map.replace!(:spice, "melt_your_face")
  end
end

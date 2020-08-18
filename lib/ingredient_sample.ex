defmodule DiDemo.IngredientSample do
  @tortillas ["corn", "flour", "hard shell"]
  @salsa_type ["red", "green", "blue"]
  @salsa_spice ["mild", "hot", "huh"]
  @base_type ["asada", "pastor", "fajitas", "veggies"]

  def random(count) when is_integer(count) do
    1..count
    |> Enum.map(fn _ ->
      [
        Enum.random(@base_type),
        Enum.random(@tortillas),
        Enum.random(@salsa_type),
        Enum.random(@salsa_spice)
      ]
      |> Enum.join(",")
    end)
  end
end

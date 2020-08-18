defmodule DiDemo.TacoEaterA do
  @moduledoc """
   This module is responsible for eating tacos
  """

  @doc """
   Takes a list of tacos and eats the last one. Returns tuple with
   eaten taco and remaining tacos.

   tacos = ["asada", "pastor"]
   iex> DiDemo.TacoEater(tacos)
   > {"pastor", ["asada"]}
  """

  def eat(tacos) do
    List.pop_at(tacos, -1)
  end
end

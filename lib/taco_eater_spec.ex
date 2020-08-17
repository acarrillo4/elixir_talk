defmodule DiDemo.TacoEater do
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

 @spec eat(list()) :: {String.t(), list()} | String.t()
 def eat(tacos) do
  if is_list(tacos) do
    List.pop_at(tacos, -1)
  else
   IO.puts("Sorry those are not tacos")
  end
 end




 def eat(tacos) when is_list(tacos) do
  List.pop_at(tacos, -1)
 end

 def eat(_), do: IO.puts("Sorry those are not tacos")

end

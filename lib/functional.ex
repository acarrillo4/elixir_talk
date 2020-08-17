defmodule DIDemo.Functional do

  @moduledoc """
  tacos = ["asada", "pastor", "fajitas", "veggie"]

  JS tacos.pop()
  Elixir
  List.(tab)  #Tab to show available functions.
  iex> h List.pop_at

  iex(9)> List.pop_at(tacos, -1)
  {"veggie", ["asada", "pastor", "fajitas"]}

  Explicit vs. Implicit
  tacos can be reassigned, but it has to be done explicitly.

  iex(11)> {eaten, tacos} = List.pop_at(tacos, -1)
  {"veggie", ["asada", "pastor", "fajitas"]}
  """

end

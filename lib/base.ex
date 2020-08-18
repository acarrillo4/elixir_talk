defmodule DiDemo.Base do
  @moduledoc """
  Module to work with bases
  """

  alias DiDemo.Base

  defstruct type: nil

  @valid_types [
    "asada",
    "pastor",
    "fajitas",
    "veggies"
  ]

  @doc """
  Given a valid taco base, returns a %Base{} struct.
  Returns error tuple {:error, message} otherwise.

  ## Examples:
      iex> DiDemo.Base.add("pastor")
      %Base{type: "pastor"}

      iex> DiDemo.Base.add("mole")
      {:error, "Sorry, we don't make mole tacos"}
  """
  def add(type) when type in @valid_types do
    %Base{type: type}
  end

  def add(type), do: {:error, "Sorry, we don't make #{type} tacos"}
end

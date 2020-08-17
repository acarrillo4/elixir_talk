defmodule DiDemo.Base do
  alias DiDemo.Base

  defstruct type: nil

  @valid_bases ["asada", "pastor", "fajitas", "veggies"]

  def add_base(type) when type in @valid_bases do
    %Base{type: type}
  end

  def add_base(_), do: :error
end

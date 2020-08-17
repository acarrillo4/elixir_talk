defmodule DiDemo.TacoMaker do
  alias DiDemo.Base, as: TacoBase
  alias DiDemo.Salsa
  alias DiDemo.Taco
  alias DiDemo.Tortilla

  # @spec place_order(String.t() :: %Taco{})
  # "asada,flour,red,mild"
  def place_order(order) do
    with [base, tortilla, salsa_type, salsa_spice] <- grab_ingredients(order),
    %TacoBase{} = taco_base <- TacoBase.add(base),
    %Salsa{} = salsa <- Salsa.add(salsa_type, salsa_spice),
    %Tortilla{} = tortilla <- Tortilla.warm_up(tortilla)
    do
      %Taco{
        base: taco_base,
        salsa: salsa,
        tortilla: tortilla
    }
    else
      error -> IO.inspect(error)
    end
  end

  defp grab_ingredients(ingredients) do
    String.split(ingredients, ",")
    # ["asada", "flour", "red", "mild"]
  end
end

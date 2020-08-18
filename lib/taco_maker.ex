defmodule DiDemo.TacoMaker do
  alias DiDemo.Base, as: TacoBase
  alias DiDemo.Salsa
  alias DiDemo.Taco
  alias DiDemo.Tortilla

  # @spec place_order(String.t() :: Taco.t() | {:error, String.t()})
  # "asada,flour,red,mild"
  def place_order(order) do
    with [base, tortilla, salsa_type, salsa_spice] <- grab_ingredients(order),
         %TacoBase{} = taco_base <- TacoBase.add(base),
         %Salsa{} = salsa <- Salsa.add(salsa_type, salsa_spice),
         %Tortilla{warm: true} = tortilla <- Tortilla.warm_up(tortilla)
    do
      %Taco{
        base: taco_base,
        salsa: salsa,
        tortilla: tortilla
      }
    else
      #{:error, message} = error
      error -> IO.inspect(error)
    end
  end

  defp grab_ingredients(ingredients) do
    String.split(ingredients, ",")
    # ["asada", "flour", "red", "mild"]
  end
end

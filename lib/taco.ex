defmodule DiDemo.Taco do
  alias DiDemo.{Base, Salsa, Tortilla}

  @type t :: %__MODULE__{
          base: Base.t(),
          salsa: Salsa.t(),
          tortilla: Tortilla.t()
        }
  defstruct base: %Base{},
            salsa: %Salsa{},
            tortilla: %Tortilla{}
end

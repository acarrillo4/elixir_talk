defmodule DiDemo.TacoWorker do
  alias DiDemo.TacoMaker
  alias DiDemo.Taco

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    IO.puts("starting TacoWorker #{inspect(self())}")
    {:ok, nil}
  end

  def handle_call({:make_taco, order}, _from, state) do
    IO.puts("Taco order received: #{order}")

    Enum.random(1..500)
    |> Process.sleep()

    case TacoMaker.place_order(order) do
      %Taco{} = taco ->
        IO.inspect(taco, label: "Taco ready!:")
        {:reply, taco, state}

      error ->
        IO.inspect(error, label: "Uhoh... order went bad:")
        {:reply, error, state}
    end
  end
end

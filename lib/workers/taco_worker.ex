defmodule DiDemo.TacoWorker do
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

    {:reply, "MADE TACO", state}
  end
end

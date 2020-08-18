defmodule DiDemo.BulkMaker do
  alias DiDemo.IngredientSample

  @timeout 10_000

  def make_sync(count) do
    start = DateTime.utc_now()

    tacos =
      IngredientSample.random(count)
      |> Enum.map(fn order ->
        make_order(order)
      end)

    _ = log_time(start)

    tacos
  end

  def make_async(count) do
    start = DateTime.utc_now()

    tacos =
      IngredientSample.random(count)
      |> Enum.map(fn order ->
        Task.async(fn -> make_order(order) end)
      end)
      |> Enum.map(&Task.await/1)

    _ = log_time(start)

    tacos
  end

  def make_sanely(count) do
    IngredientSample.random(count)
    |> Enum.map(fn order -> get_worker(order) end)
    |> Enum.each(fn task -> Task.await(task, @timeout) end)
  end

  defp get_worker(order) do
    Task.async(fn ->
      :poolboy.transaction(
        :taco_worker,
        fn pid -> GenServer.call(pid, {:make_taco, order}) end,
        @timeout
      )
    end)
  end

  defp make_order(order) do
    %{order: order}
  end

  defp log_time(start) do
    start
    |> DateTime.diff(DateTime.utc_now(), :nanosecond)
    |> IO.inspect(label: :time)
  end
end

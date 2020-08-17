defmodule DiDemo.BulkMaker do
  alias DiDemo.IngredientSample

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

  defp make_order(order) do
    %{order: order}
  end

  defp log_time(start) do
    start
    |> DateTime.diff(DateTime.utc_now(), :nanosecond)
    |> IO.inspect(label: :time)
  end
end

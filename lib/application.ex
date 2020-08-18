defmodule DiDemo.Application do
  use Application

  defp poolboy_config do
    [
      name: {:local, :taco_worker},
      worker_module: DiDemo.TacoWorker,
      size: 3,
      max_overflow: 20
    ]
  end

  def start(_type, _args) do
    children = [
      :poolboy.child_spec(:taco_worker, poolboy_config())
    ]

    opts = [strategy: :one_for_one, name: DiDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

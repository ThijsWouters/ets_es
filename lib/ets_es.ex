defmodule EtsEs do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: EtsEs.Worker.start_link(arg1, arg2, arg3)
      # worker(EtsEs.Worker, [arg1, arg2, arg3]),
    ]

    :ets.new(:component, [:set, :public, :named_table])
    :ets.new(:entity, [:set, :public, :named_table])
    :ets.new(:entity_components, [:bag, :public, :named_table])

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EtsEs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run(0), do: nil
  def run(times) do
    DrawSystem.process
    TimeSystem.process
    run(times - 1)
  end
end

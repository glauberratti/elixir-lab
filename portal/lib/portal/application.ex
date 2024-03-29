defmodule Portal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # children = [
    #   # Starts a worker by calling: Portal.Worker.start_link(arg)
    #   # {Portal.Worker, arg}
    # ]

    # # See https://hexdocs.pm/elixir/Supervisor.html
    # # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: Portal.Supervisor]
    # Supervisor.start_link(children, opts)

    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: Portal.DoorSupervisor}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Portal.Supervisor)
  end
end

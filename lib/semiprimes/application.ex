defmodule Semiprimes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SemiprimesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Semiprimes.PubSub},
      # Start the Endpoint (http/https)
      SemiprimesWeb.Endpoint
      # Start a worker by calling: Semiprimes.Worker.start_link(arg)
      # {Semiprimes.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Semiprimes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SemiprimesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

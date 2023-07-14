defmodule TestFlyCurvyApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestFlyCurvyAppWeb.Telemetry,
      # Start the Ecto repository
      TestFlyCurvyApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestFlyCurvyApp.PubSub},
      # Start Finch
      {Finch, name: TestFlyCurvyApp.Finch},
      # Start the Endpoint (http/https)
      TestFlyCurvyAppWeb.Endpoint
      # Start a worker by calling: TestFlyCurvyApp.Worker.start_link(arg)
      # {TestFlyCurvyApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestFlyCurvyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestFlyCurvyAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

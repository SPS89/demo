defmodule MyTypingTutorial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyTypingTutorialWeb.Telemetry,
      MyTypingTutorial.Repo,
      {DNSCluster, query: Application.get_env(:my_typing_tutorial, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MyTypingTutorial.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MyTypingTutorial.Finch},
      # Start a worker by calling: MyTypingTutorial.Worker.start_link(arg)
      # {MyTypingTutorial.Worker, arg},
      # Start to serve requests, typically the last entry
      MyTypingTutorialWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyTypingTutorial.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyTypingTutorialWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

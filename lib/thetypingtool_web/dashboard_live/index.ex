
defmodule ThetypingtoolWeb.DashboardLive.Index do
  use ThetypingtoolWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :message, "Dashboard Coming soon!")}
  end
end


defmodule TypingTool.ResultStore do
  use Agent

  # Start the agent with an empty list
  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  # Save typing test result
  def save_result(result) do
    Agent.update(__MODULE__, fn results -> [result | results] end)
  end

  # Get all stored results
  def get_results do
    Agent.get(__MODULE__, fn results -> results end)
  end
end

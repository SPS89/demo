defmodule ThetypingtoolWeb.PracticeLive.Show do
  use ThetypingtoolWeb, :live_view

  alias Thetypingtool.Typing

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:practice, Typing.get_practice!(id))}
  end

  defp page_title(:show), do: "Show Practice"
  defp page_title(:edit), do: "Edit Practice"
end

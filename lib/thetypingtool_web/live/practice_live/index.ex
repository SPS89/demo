defmodule ThetypingtoolWeb.PracticeLive.Index do
  use ThetypingtoolWeb, :live_view

  alias Thetypingtool.Typing
  alias Thetypingtool.Typing.Practice

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :typing_practices, Typing.list_typing_practices())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Practice")
    |> assign(:practice, Typing.get_practice!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Practice")
    |> assign(:practice, %Practice{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Typing practices")
    |> assign(:practice, nil)
  end

  @impl true
  def handle_info({ThetypingtoolWeb.PracticeLive.FormComponent, {:saved, practice}}, socket) do
    {:noreply, stream_insert(socket, :typing_practices, practice)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    practice = Typing.get_practice!(id)
    {:ok, _} = Typing.delete_practice(practice)

    {:noreply, stream_delete(socket, :typing_practices, practice)}
  end
end

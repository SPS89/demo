defmodule ThetypingtoolWeb.PracticeLive.FormComponent do
  use ThetypingtoolWeb, :live_component

  alias Thetypingtool.Typing

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage practice records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="practice-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

        <:actions>
          <.button phx-disable-with="Saving...">Save Practice</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{practice: practice} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Typing.change_practice(practice))
     end)}
  end

  @impl true
  def handle_event("validate", %{"practice" => practice_params}, socket) do
    changeset = Typing.change_practice(socket.assigns.practice, practice_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"practice" => practice_params}, socket) do
    save_practice(socket, socket.assigns.action, practice_params)
  end

  defp save_practice(socket, :edit, practice_params) do
    case Typing.update_practice(socket.assigns.practice, practice_params) do
      {:ok, practice} ->
        notify_parent({:saved, practice})

        {:noreply,
         socket
         |> put_flash(:info, "Practice updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_practice(socket, :new, practice_params) do
    case Typing.create_practice(practice_params) do
      {:ok, practice} ->
        notify_parent({:saved, practice})

        {:noreply,
         socket
         |> put_flash(:info, "Practice created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

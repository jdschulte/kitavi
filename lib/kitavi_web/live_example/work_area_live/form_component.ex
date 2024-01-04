defmodule KitaviWeb.WorkAreaLive.FormComponent do
  use KitaviWeb, :live_component

  alias Kitavi.WorkAreas

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage work_area records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="work_area-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:abbreviation]} type="text" label="Abbreviation" />
        <.input field={@form[:color]} type="text" label="Color" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Work area</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{work_area: work_area} = assigns, socket) do
    changeset = WorkAreas.change_work_area(work_area)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"work_area" => work_area_params}, socket) do
    changeset =
      socket.assigns.work_area
      |> WorkAreas.change_work_area(work_area_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"work_area" => work_area_params}, socket) do
    save_work_area(socket, socket.assigns.action, work_area_params)
  end

  defp save_work_area(socket, :edit, work_area_params) do
    case WorkAreas.update_work_area(socket.assigns.work_area, work_area_params) do
      {:ok, work_area} ->
        notify_parent({:saved, work_area})

        {:noreply,
         socket
         |> put_flash(:info, "Work area updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_work_area(socket, :new, work_area_params) do
    case WorkAreas.create_work_area(work_area_params) do
      {:ok, work_area} ->
        notify_parent({:saved, work_area})

        {:noreply,
         socket
         |> put_flash(:info, "Work area created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

defmodule KitaviWeb.WorkAreaLive.Index do
  use KitaviWeb, :live_view

  alias Kitavi.WorkAreas
  alias Kitavi.WorkAreas.WorkArea

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :work_area_collection, WorkAreas.list_work_area())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Work area")
    |> assign(:work_area, WorkAreas.get_work_area!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Work area")
    |> assign(:work_area, %WorkArea{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Work area")
    |> assign(:work_area, nil)
  end

  @impl true
  def handle_info({KitaviWeb.WorkAreaLive.FormComponent, {:saved, work_area}}, socket) do
    {:noreply, stream_insert(socket, :work_area_collection, work_area)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    work_area = WorkAreas.get_work_area!(id)
    {:ok, _} = WorkAreas.delete_work_area(work_area)

    {:noreply, stream_delete(socket, :work_area_collection, work_area)}
  end
end

defmodule KitaviWeb.WorkAreaLive.Show do
  use KitaviWeb, :live_view

  alias Kitavi.WorkAreas

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:work_area, WorkAreas.get_work_area!(id))}
  end

  defp page_title(:show), do: "Show Work area"
  defp page_title(:edit), do: "Edit Work area"
end

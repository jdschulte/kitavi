defmodule KitaviWeb.PageHTML do
  use KitaviWeb, :html

  def home(assigns) do
    ~H"""
    <div>
      <h1>Home</h1>
    </div>
    """
  end
end

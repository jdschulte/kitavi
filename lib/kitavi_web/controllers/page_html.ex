defmodule KitaviWeb.PageHTML do
  use KitaviWeb, :html

  def home(assigns) do
    ~H"""
    <div>
      <h1>Home</h1>
      <p>Hello <%= @name %></p>
    </div>
    """
  end
end

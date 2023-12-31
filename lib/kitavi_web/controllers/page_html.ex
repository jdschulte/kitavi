defmodule KitaviWeb.PageHTML do
  use KitaviWeb, :html

  def home(assigns) do
    ~H"""
    <h1>Hello, <%= @name %>!</h1>
    """
  end
end

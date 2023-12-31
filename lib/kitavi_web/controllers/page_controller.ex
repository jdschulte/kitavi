defmodule KitaviWeb.PageController do
  use KitaviWeb, :controller

  def home(conn, %{"name" => name}) do
    render(conn, :home, name: name)
  end
end

defmodule KitaviWeb.PageController do
  use KitaviWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

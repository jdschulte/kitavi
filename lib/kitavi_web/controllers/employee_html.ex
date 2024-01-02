defmodule KitaviWeb.EmployeeHTML do
  use KitaviWeb, :html

  embed_templates "employee_html/*"

  @doc """
  Renders a employee form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def employee_form(assigns)
end

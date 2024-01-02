defmodule Kitavi.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :abbreviation, :string
    field :color, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:first_name, :last_name, :abbreviation, :color])
    |> validate_required([:first_name, :abbreviation, :color])
  end
end

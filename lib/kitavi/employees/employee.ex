defmodule Kitavi.Employees.Employee do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kitavi.Helpers.SchemaHelpers

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :abbreviation, :string
    field :color, :string

    timestamps(type: :utc_datetime)
  end

  @required_fields [:first_name, :abbreviation, :color]
  @optional_fields [:last_name]

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:abbreviation, max: 2)
    |> SchemaHelpers.validate_max_length([:first_name, :last_name, :color])
  end
end

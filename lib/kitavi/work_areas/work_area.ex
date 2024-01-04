defmodule Kitavi.WorkAreas.WorkArea do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kitavi.Helpers.SchemaHelpers

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "work_areas" do
    field :name, :string
    field :color, :string
    field :abbreviation, :string

    timestamps(type: :utc_datetime)
  end

  @required_fields [:name, :abbreviation, :color]

  @doc false
  def changeset(work_area, attrs) do
    work_area
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:abbreviation, max: 2)
    |> SchemaHelpers.validate_max_length([:name, :color])
  end
end

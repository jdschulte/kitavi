defmodule Kitavi.Person do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "persons" do
    field :first_name, :string
    field :last_name, :string, default: ""

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name])
    |> validate_length(:first_name, max: 255)
    |> validate_length(:last_name, max: 255)
  end
end

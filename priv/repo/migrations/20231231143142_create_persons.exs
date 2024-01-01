defmodule Kitavi.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :last_name, :string, default: ""

      timestamps(type: :utc_datetime)
    end
  end
end

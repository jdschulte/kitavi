defmodule Kitavi.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string, null: false
      add :last_name, :string, default: ""
      add :abbreviation, :string, null: false
      add :color, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end

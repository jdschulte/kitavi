defmodule Kitavi.Repo.Migrations.CreateWorkArea do
  use Ecto.Migration

  def change do
    create table(:work_area, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :abbreviation, :string, null: false
      add :color, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end

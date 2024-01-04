defmodule Kitavi.Repo.Migrations.CreateEmployeeWorkAreas do
  use Ecto.Migration

  def change do
    create table(:employee_work_areas, primary_key: false) do
      add :employee_id, references(:employees, type: :binary_id, on_delete: :delete_all)
      add :work_area_id, references(:work_areas, type: :binary_id, on_delete: :delete_all)

      add :created_at, :utc_datetime, default: fragment("current_timestamp")
    end

    create index(:employee_work_areas, [:employee_id])
    create unique_index(:employee_work_areas, [:work_area_id, :employee_id])
  end
end

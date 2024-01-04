# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Kitavi.Repo.insert!(%Kitavi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds do
  # Function to populate the database with employees
  def populate_employees() do
    for employee <- [
          %{first_name: "John", last_name: "Doe", abbreviation: "JD", color: "#ff0000"},
          %{first_name: "Jane", last_name: "Doe", abbreviation: "JD", color: "#00ff00"},
          %{first_name: "John", last_name: "Smith", abbreviation: "JS", color: "#0000ff"},
          %{first_name: "Jane", last_name: "Smith", abbreviation: "JS", color: "#ffff00"}
        ] do
      {:ok, _} =
        Kitavi.Employees.create_employee(employee)
    end
  end

  # Function to populate the database with work areas
  def populate_work_areas() do
    for work_area <- [
          %{name: "Gruppe1", abbreviation: "G1", color: "#ff0000"},
          %{name: "Gruppe2", abbreviation: "G2", color: "#00ff00"},
          %{name: "Gruppe3", abbreviation: "G3", color: "#0000ff"}
        ] do
      {:ok, _} =
        Kitavi.WorkAreas.create_work_area(work_area)
    end
  end

  # Function to populate the database with employee and work area associations
  def populate_employee_work_area_associations() do
    # Retrieve the IDs of all work areas
    work_area_ids =
      Kitavi.WorkAreas.list_work_areas()
      |> Enum.map(& &1.id)

    # Retrieve a list of all employees
    employees = Kitavi.Employees.list_employees()

    # Update employees with work area assignments
    Enum.with_index(employees, fn employee, index ->
      case index do
        0 ->
          # Update the first employee to be in all work areas
          {:ok, _} =
            Kitavi.Employees.update_employee(employee, %{"work_area_ids" => work_area_ids})

        1 ->
          # Update the second employee to be in the first work area
          {:ok, _} =
            Kitavi.Employees.update_employee(employee, %{
              "work_area_ids" => [Enum.at(work_area_ids, 0)]
            })

        2 ->
          # Update the third employee to be in the second work area
          {:ok, _} =
            Kitavi.Employees.update_employee(employee, %{
              "work_area_ids" => [Enum.at(work_area_ids, 1)]
            })

        _ ->
          # Handle additional employees if needed
          :ok
      end
    end)
  end
end

# # Populate the database with employees
# Seeds.populate_employees()

# # Populate the database with work areas
# Seeds.populate_work_areas()

# # Populate the database with employee and work area associations
# Seeds.populate_employee_work_area_associations()

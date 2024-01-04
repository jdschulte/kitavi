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

for employee <- [
      %{first_name: "John", last_name: "Doe", abbreviation: "JD", color: "#ff0000"},
      %{first_name: "Jane", last_name: "Doe", abbreviation: "JD", color: "#00ff00"},
      %{first_name: "John", last_name: "Smith", abbreviation: "JS", color: "#0000ff"},
      %{first_name: "Jane", last_name: "Smith", abbreviation: "JS", color: "#ffff00"}
    ] do
  {:ok, _} =
    Kitavi.Employees.create_employee(employee)
end

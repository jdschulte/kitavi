defmodule Kitavi.EmployeesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kitavi.Employees` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        abbreviation: "some abbreviation",
        color: "some color",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Kitavi.Employees.create_employee()

    employee
  end
end

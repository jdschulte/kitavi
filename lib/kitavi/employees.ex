defmodule Kitavi.Employees do
  @moduledoc """
  The Employees context.
  """

  import Ecto.Query, warn: false
  alias Kitavi.Repo

  alias Kitavi.Employees.Employee
  alias Kitavi.WorkAreas.WorkArea

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id) do
    Employee |> Repo.get!(id) |> Repo.preload(:work_areas)
  end

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> change_employee(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> change_employee(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{data: %Employee{}}

  """
  def change_employee(%Employee{} = employee, attrs \\ %{}) do
    work_areas = list_work_areas_by_id(attrs["work_area_ids"])

    employee
    |> Repo.preload(:work_areas)
    |> Employee.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:work_areas, work_areas)
  end

  @doc """
  Returns the list of work areas.
  and returns an empty list if no work areas exist.
  """
  def list_work_areas_by_id(nil), do: []

  def list_work_areas_by_id(work_area_ids) do
    Repo.all(from w in WorkArea, where: w.id in ^work_area_ids)
  end
end

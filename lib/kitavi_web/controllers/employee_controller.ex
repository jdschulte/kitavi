defmodule KitaviWeb.EmployeeController do
  use KitaviWeb, :controller

  alias Kitavi.Employees
  alias Kitavi.Employees.Employee

  def index(conn, _params) do
    employees = Employees.list_employees()
    render(conn, :index, employees: employees)
  end

  def new(conn, _params) do
    changeset = Employees.change_employee(%Employee{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"employee" => employee_params}) do
    case Employees.create_employee(employee_params) do
      {:ok, employee} ->
        conn
        |> put_flash(:info, "Employee created successfully.")
        |> redirect(to: ~p"/employees/#{employee}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Employees.get_employee!(id)
    render(conn, :show, employee: employee)
  end

  def edit(conn, %{"id" => id}) do
    employee = Employees.get_employee!(id)
    changeset = Employees.change_employee(employee)
    render(conn, :edit, employee: employee, changeset: changeset)
  end

  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Employees.get_employee!(id)

    case Employees.update_employee(employee, employee_params) do
      {:ok, employee} ->
        conn
        |> put_flash(:info, "Employee updated successfully.")
        |> redirect(to: ~p"/employees/#{employee}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, employee: employee, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Employees.get_employee!(id)
    {:ok, _employee} = Employees.delete_employee(employee)

    conn
    |> put_flash(:info, "Employee deleted successfully.")
    |> redirect(to: ~p"/employees")
  end
end

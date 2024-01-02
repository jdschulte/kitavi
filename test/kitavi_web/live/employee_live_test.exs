defmodule KitaviWeb.EmployeeLiveTest do
  use KitaviWeb.ConnCase

  import Phoenix.LiveViewTest
  import Kitavi.EmployeesFixtures

  @create_attrs %{color: "some color", first_name: "some first_name", last_name: "some last_name", abbreviation: "some abbreviation"}
  @update_attrs %{color: "some updated color", first_name: "some updated first_name", last_name: "some updated last_name", abbreviation: "some updated abbreviation"}
  @invalid_attrs %{color: nil, first_name: nil, last_name: nil, abbreviation: nil}

  defp create_employee(_) do
    employee = employee_fixture()
    %{employee: employee}
  end

  describe "Index" do
    setup [:create_employee]

    test "lists all employees", %{conn: conn, employee: employee} do
      {:ok, _index_live, html} = live(conn, ~p"/employees")

      assert html =~ "Listing Employees"
      assert html =~ employee.color
    end

    test "saves new employee", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/employees")

      assert index_live |> element("a", "New Employee") |> render_click() =~
               "New Employee"

      assert_patch(index_live, ~p"/employees/new")

      assert index_live
             |> form("#employee-form", employee: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#employee-form", employee: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/employees")

      html = render(index_live)
      assert html =~ "Employee created successfully"
      assert html =~ "some color"
    end

    test "updates employee in listing", %{conn: conn, employee: employee} do
      {:ok, index_live, _html} = live(conn, ~p"/employees")

      assert index_live |> element("#employees-#{employee.id} a", "Edit") |> render_click() =~
               "Edit Employee"

      assert_patch(index_live, ~p"/employees/#{employee}/edit")

      assert index_live
             |> form("#employee-form", employee: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#employee-form", employee: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/employees")

      html = render(index_live)
      assert html =~ "Employee updated successfully"
      assert html =~ "some updated color"
    end

    test "deletes employee in listing", %{conn: conn, employee: employee} do
      {:ok, index_live, _html} = live(conn, ~p"/employees")

      assert index_live |> element("#employees-#{employee.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#employees-#{employee.id}")
    end
  end

  describe "Show" do
    setup [:create_employee]

    test "displays employee", %{conn: conn, employee: employee} do
      {:ok, _show_live, html} = live(conn, ~p"/employees/#{employee}")

      assert html =~ "Show Employee"
      assert html =~ employee.color
    end

    test "updates employee within modal", %{conn: conn, employee: employee} do
      {:ok, show_live, _html} = live(conn, ~p"/employees/#{employee}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Employee"

      assert_patch(show_live, ~p"/employees/#{employee}/show/edit")

      assert show_live
             |> form("#employee-form", employee: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#employee-form", employee: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/employees/#{employee}")

      html = render(show_live)
      assert html =~ "Employee updated successfully"
      assert html =~ "some updated color"
    end
  end
end

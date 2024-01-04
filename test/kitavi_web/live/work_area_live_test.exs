defmodule KitaviWeb.WorkAreaLiveTest do
  use KitaviWeb.ConnCase

  import Phoenix.LiveViewTest
  import Kitavi.WorkAreasFixtures

  @create_attrs %{name: "some name", color: "some color", abbreviation: "some abbreviation"}
  @update_attrs %{name: "some updated name", color: "some updated color", abbreviation: "some updated abbreviation"}
  @invalid_attrs %{name: nil, color: nil, abbreviation: nil}

  defp create_work_area(_) do
    work_area = work_area_fixture()
    %{work_area: work_area}
  end

  describe "Index" do
    setup [:create_work_area]

    test "lists all work_area", %{conn: conn, work_area: work_area} do
      {:ok, _index_live, html} = live(conn, ~p"/work_area")

      assert html =~ "Listing Work area"
      assert html =~ work_area.name
    end

    test "saves new work_area", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/work_area")

      assert index_live |> element("a", "New Work area") |> render_click() =~
               "New Work area"

      assert_patch(index_live, ~p"/work_area/new")

      assert index_live
             |> form("#work_area-form", work_area: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#work_area-form", work_area: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/work_area")

      html = render(index_live)
      assert html =~ "Work area created successfully"
      assert html =~ "some name"
    end

    test "updates work_area in listing", %{conn: conn, work_area: work_area} do
      {:ok, index_live, _html} = live(conn, ~p"/work_area")

      assert index_live |> element("#work_area-#{work_area.id} a", "Edit") |> render_click() =~
               "Edit Work area"

      assert_patch(index_live, ~p"/work_area/#{work_area}/edit")

      assert index_live
             |> form("#work_area-form", work_area: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#work_area-form", work_area: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/work_area")

      html = render(index_live)
      assert html =~ "Work area updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes work_area in listing", %{conn: conn, work_area: work_area} do
      {:ok, index_live, _html} = live(conn, ~p"/work_area")

      assert index_live |> element("#work_area-#{work_area.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#work_area-#{work_area.id}")
    end
  end

  describe "Show" do
    setup [:create_work_area]

    test "displays work_area", %{conn: conn, work_area: work_area} do
      {:ok, _show_live, html} = live(conn, ~p"/work_area/#{work_area}")

      assert html =~ "Show Work area"
      assert html =~ work_area.name
    end

    test "updates work_area within modal", %{conn: conn, work_area: work_area} do
      {:ok, show_live, _html} = live(conn, ~p"/work_area/#{work_area}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Work area"

      assert_patch(show_live, ~p"/work_area/#{work_area}/show/edit")

      assert show_live
             |> form("#work_area-form", work_area: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#work_area-form", work_area: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/work_area/#{work_area}")

      html = render(show_live)
      assert html =~ "Work area updated successfully"
      assert html =~ "some updated name"
    end
  end
end

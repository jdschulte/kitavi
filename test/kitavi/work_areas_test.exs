defmodule Kitavi.WorkAreasTest do
  use Kitavi.DataCase

  alias Kitavi.WorkAreas

  describe "work_area" do
    alias Kitavi.WorkAreas.WorkArea

    import Kitavi.WorkAreasFixtures

    @invalid_attrs %{name: nil, color: nil, abbreviation: nil}

    test "list_work_area/0 returns all work_area" do
      work_area = work_area_fixture()
      assert WorkAreas.list_work_area() == [work_area]
    end

    test "get_work_area!/1 returns the work_area with given id" do
      work_area = work_area_fixture()
      assert WorkAreas.get_work_area!(work_area.id) == work_area
    end

    test "create_work_area/1 with valid data creates a work_area" do
      valid_attrs = %{name: "some name", color: "some color", abbreviation: "some abbreviation"}

      assert {:ok, %WorkArea{} = work_area} = WorkAreas.create_work_area(valid_attrs)
      assert work_area.name == "some name"
      assert work_area.color == "some color"
      assert work_area.abbreviation == "some abbreviation"
    end

    test "create_work_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WorkAreas.create_work_area(@invalid_attrs)
    end

    test "update_work_area/2 with valid data updates the work_area" do
      work_area = work_area_fixture()
      update_attrs = %{name: "some updated name", color: "some updated color", abbreviation: "some updated abbreviation"}

      assert {:ok, %WorkArea{} = work_area} = WorkAreas.update_work_area(work_area, update_attrs)
      assert work_area.name == "some updated name"
      assert work_area.color == "some updated color"
      assert work_area.abbreviation == "some updated abbreviation"
    end

    test "update_work_area/2 with invalid data returns error changeset" do
      work_area = work_area_fixture()
      assert {:error, %Ecto.Changeset{}} = WorkAreas.update_work_area(work_area, @invalid_attrs)
      assert work_area == WorkAreas.get_work_area!(work_area.id)
    end

    test "delete_work_area/1 deletes the work_area" do
      work_area = work_area_fixture()
      assert {:ok, %WorkArea{}} = WorkAreas.delete_work_area(work_area)
      assert_raise Ecto.NoResultsError, fn -> WorkAreas.get_work_area!(work_area.id) end
    end

    test "change_work_area/1 returns a work_area changeset" do
      work_area = work_area_fixture()
      assert %Ecto.Changeset{} = WorkAreas.change_work_area(work_area)
    end
  end
end

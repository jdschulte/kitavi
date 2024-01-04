defmodule Kitavi.WorkAreasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kitavi.WorkAreas` context.
  """

  @doc """
  Generate a work_area.
  """
  def work_area_fixture(attrs \\ %{}) do
    {:ok, work_area} =
      attrs
      |> Enum.into(%{
        abbreviation: "some abbreviation",
        color: "some color",
        name: "some name"
      })
      |> Kitavi.WorkAreas.create_work_area()

    work_area
  end
end

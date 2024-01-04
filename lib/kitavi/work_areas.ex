defmodule Kitavi.WorkAreas do
  @moduledoc """
  The WorkAreas context.
  """

  import Ecto.Query, warn: false
  alias Kitavi.Repo

  alias Kitavi.WorkAreas.WorkArea

  @doc """
  Returns the list of work_area.

  ## Examples

      iex> list_work_area()
      [%WorkArea{}, ...]

  """
  def list_work_area do
    Repo.all(WorkArea)
  end

  @doc """
  Gets a single work_area.

  Raises `Ecto.NoResultsError` if the Work area does not exist.

  ## Examples

      iex> get_work_area!(123)
      %WorkArea{}

      iex> get_work_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work_area!(id), do: Repo.get!(WorkArea, id)

  @doc """
  Creates a work_area.

  ## Examples

      iex> create_work_area(%{field: value})
      {:ok, %WorkArea{}}

      iex> create_work_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work_area(attrs \\ %{}) do
    %WorkArea{}
    |> WorkArea.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work_area.

  ## Examples

      iex> update_work_area(work_area, %{field: new_value})
      {:ok, %WorkArea{}}

      iex> update_work_area(work_area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work_area(%WorkArea{} = work_area, attrs) do
    work_area
    |> WorkArea.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a work_area.

  ## Examples

      iex> delete_work_area(work_area)
      {:ok, %WorkArea{}}

      iex> delete_work_area(work_area)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work_area(%WorkArea{} = work_area) do
    Repo.delete(work_area)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work_area changes.

  ## Examples

      iex> change_work_area(work_area)
      %Ecto.Changeset{data: %WorkArea{}}

  """
  def change_work_area(%WorkArea{} = work_area, attrs \\ %{}) do
    WorkArea.changeset(work_area, attrs)
  end
end

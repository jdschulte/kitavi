defmodule Kitavi.Helpers.SchemaHelpers do
  @moduledoc """
  This module provides helper functions for working with schemas in the Kitavi application.
  """

  import Ecto.Changeset

  @doc """
  Validates the maximum length of the specified fields in the changeset.

  ## Params

  - `changeset`: The changeset to validate.
  - `fields`: The list of fields to validate.

  ## Returns

  The updated changeset with length validation applied to the specified fields.
  """
  def validate_max_length(changeset, fields) do
    Enum.reduce(fields, changeset, fn field, acc ->
      validate_length(acc, field, max: 255)
    end)
  end
end

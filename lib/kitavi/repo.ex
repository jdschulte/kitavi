defmodule Kitavi.Repo do
  use Ecto.Repo,
    otp_app: :kitavi,
    adapter: Ecto.Adapters.Postgres
end

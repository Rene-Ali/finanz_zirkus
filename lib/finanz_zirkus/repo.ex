defmodule FinanzZirkus.Repo do
  use Ecto.Repo,
    otp_app: :finanz_zirkus,
    adapter: Ecto.Adapters.Postgres
end

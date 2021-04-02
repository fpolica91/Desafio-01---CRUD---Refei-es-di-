defmodule MealsReport.Repo do
  use Ecto.Repo,
    otp_app: :meals_report,
    adapter: Ecto.Adapters.Postgres
end

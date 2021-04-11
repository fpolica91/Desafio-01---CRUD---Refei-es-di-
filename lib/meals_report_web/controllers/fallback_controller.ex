defmodule MealsReportWeb.FallbackController do
  use MealsReportWeb, :controller
  alias MealsReport.Error
  alias MealsReportWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |>put_status(status)
    |>put_view(ErrorView)
    |>render("error.json", result: result)
  end
end

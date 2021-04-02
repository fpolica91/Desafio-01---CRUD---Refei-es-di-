defmodule  MealsReportWeb.WelcomeController do
  use MealsReportWeb, :controller

  def index(connection, _param) do
    connection
    |>put_status(:ok)
    |>json("Welcome controller, greets you")
  end

end

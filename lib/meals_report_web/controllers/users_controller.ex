defmodule MealsReportWeb.UsersController do
  use MealsReportWeb, :controller
  alias MealsReport.User



  def create(connection, params) do
    with {:ok, %User{} = user} <- MealsReport.create_user(params)  do
      connection
      |>put_status(:created)
      |>json(user)
    end
  end


  def show(connection, %{"id" => id}) do
    with {:ok, %User{} = user} <- MealsReport.get_user(id)  do
      connection
      |>put_status(:ok)
      |>json(user)
    end
  end
end

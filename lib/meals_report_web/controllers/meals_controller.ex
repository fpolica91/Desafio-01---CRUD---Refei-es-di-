defmodule  MealsReportWeb.MealsController do
  use MealsReportWeb, :controller
  alias MealsReport.Meals

  def create(connection, params) do
    with {:ok, %Meals{} = meals }  <- MealsReport.create_meal(params) do
      connection
      |>put_status(:created)
      |>render("meals.json", meals: meals)
    end
  end

  def show(connection, %{"id" => id}) do
    with {:ok, %Meals{} = meals} <- MealsReport.get_meal(id)  do
      connection
      |>put_status(:ok)
      |>render("meals.json", meals: meals)
    end
  end

  def delete(connection, %{"id" => id}) do
    with {:ok, %Meals{}} <- MealsReport.delete_meal(id) do
      connection
      |>put_status(:no_content)
      |>text("")
    end
  end

  def update(connection, params) do
    with {:ok, %Meals{} = meals} <- MealsReport.update_meal(params)  do
      connection
      |>put_status(:ok)
      |>render("meals.json", meals: meals)
    end
  end

end

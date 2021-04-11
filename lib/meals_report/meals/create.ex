defmodule MealsReport.Meals.Create do
  alias MealsReport.{Meals, Repo, Error}


  def call(params) do
    params
    |>Meals.changeset()
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %Meals{}} = meal) do
    {:ok, meal} = meal
    meal =  meal |> Repo.preload(:user)
    {:ok, meal}
  end

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end

end

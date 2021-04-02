defmodule MealsReport.Meals.Create do
  alias MealsReport.{Meals, Repo}

  def call(params) do
    params
    |>Meals.changeset()
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %Meals{}} = meal), do: meal

  defp handle_insert({:error, result}) do
    {:error, %{status: :bad_request, result: result}}
  end

end

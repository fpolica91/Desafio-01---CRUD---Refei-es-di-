defmodule MealsReport.Meals.Update do
  alias MealsReport.{Meals, Repo}
  alias Ecto.UUID

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      {:ok, id} -> find_meal(id, params)
      :error -> {:error, %{status: :not_found, result: "Invalid id format"}}
    end
  end


  defp find_meal(id, params) do
    case Repo.get(Meals, id) do
      nil -> {:error, "User could not be found"}
      meals -> do_update(meals, params)
    end
  end

  defp do_update(meals, params) do
    meals
    |>Meals.changeset(params)
    |>Repo.update()
  end

end

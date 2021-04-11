defmodule MealsReport.Meals.Get do
  alias MealsReport.{Meals, Repo, Error}
  alias Ecto.UUID
  # alias Ecto


  def by_id(id) do
    case UUID.cast(id) do
      {:ok, id} -> get_meal(id)
      :error -> {:error, Error.build(:bad_request, "Invalid id format" )}
    end
  end


  defp get_meal(id) do
    case Repo.get(Meals, id) do
      nil ->  {:error, Error.build(:not_found, "Meal cannot be found")}
      meals -> {:ok, meals}
    end
  end

  # defp render_meal(meals)do
  #   meals =
  #   meals
  #   |>Repo.preload(:user)
  #   {:ok, meals}
  # end



end

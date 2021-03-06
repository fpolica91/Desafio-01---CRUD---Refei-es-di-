defmodule MealsReport.Meals.Update do
  alias MealsReport.{Meals, Repo, Error}
  alias Ecto.UUID

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      {:ok, id} -> find_meal(id, params)
      :error -> {:error, Error.build(:bad_request, "Invalid Id")}
    end
  end


  defp find_meal(id, params) do
    case Repo.get(Meals, id) do
      nil -> {:error, Error.build(:not_found, "Meal could not be found")}
      meals -> do_update(meals, params)
    end
  end

  defp do_update(meals, params) do
      map_to_atom =
      params
      |> Map.new(fn {key, value} -> {String.to_atom(key), value} end)
      IO.inspect(map_to_atom)
      meals = Ecto.Changeset.change meals, map_to_atom
      Repo.update(meals)
  end

end

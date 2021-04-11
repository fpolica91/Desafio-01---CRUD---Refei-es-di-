defmodule MealsReport.Meals.Delete do
  alias MealsReport.{Meals, Repo, Error}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      {:ok, id} -> delete_by_id(id)
      :error -> {:error, Error.build(:bad_request, "Unexpected Error")}
    end
  end


  defp delete_by_id(id) do
    case Repo.get(Meals, id) do
      nil -> {:error, Error.build(:not_found, "Invalid id sent, meal cannot be found")}
      meals -> Repo.delete(meals)
    end
  end
end

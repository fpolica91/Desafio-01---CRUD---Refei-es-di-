defmodule MealsReport.Meals.Delete do
  alias MealsReport.{Meals, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      {:ok, id} -> delete_by_id(id)
      :error -> {:error, %{status: :not_found, result: "Invalid id format"}}
    end
  end


  defp delete_by_id(id) do
    case Repo.get(Meals, id) do
      nil -> {:error, "User could not be found"}
      meals -> Repo.delete(meals)
    end
  end
end

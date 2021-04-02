defmodule MealsReport.Meals.Get do
  alias MealsReport.{Meals, Repo}
  alias Ecto.UUID

  def by_id(id) do
    case UUID.cast(id) do
      {:ok, id} -> get_by_id(id)
      :error -> {:error, %{status: :not_found, result: "Invalid id format"}}
    end
  end


  defp get_by_id(id) do
    case Repo.get(Meals, id) do
      nil -> {:error, "User could not be found"}
      meals -> {:ok, meals}
    end
  end
end

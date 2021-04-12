defmodule MealsReport.Users.Get do
  alias MealsReport.{User, User, Repo, Error}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build(:bad_request, "Invalid id format")}
      {:ok, id} -> get_user(id)
    end
  end

  defp get_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User cannnot be found")}
      user ->  render_user(user)
    end
  end

  defp render_user(user) do
    user = user
    |>Repo.preload(:meals)
    {:ok, user}
  end

end

# from(user in User,
#   preload: [:meals]
# )

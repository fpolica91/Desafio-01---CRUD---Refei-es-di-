defmodule MealsReport.Users.Create do
  alias MealsReport.{User, User, Repo, Error}

  def call(params) do
    User.changeset(params)
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %User{}} = user) do
    {:ok, user} = user
     user_with_meals =
      user
      |>Repo.preload(:meals)
      {:ok, user_with_meals}
  end

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end

end

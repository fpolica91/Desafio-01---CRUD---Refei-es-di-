defmodule MealsReport.Factory do
  use ExMachina.Ecto, repo: MealsReport.Repo

  def meals_params_factory do
    %{
     description: "Pizza Vegana",
     date: NaiveDateTime.local_now(),
     calories: 450
    }
  end
end

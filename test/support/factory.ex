defmodule MealsReport.Factory do
  use ExMachina.Ecto, repo: MealsReport.Repo
  alias MealsReport.Meals

  def meals_params_factory do
    %{
     description: "Pizza Vegana",
     date: NaiveDateTime.local_now(),
     calories: 450
    }
  end

  def meals_factory do
    %Meals{
      id: "f14295b5-cf61-4a9e-8441-b78a7502508b",
      description: "Potatoe Salad",
      date: ~N[2021-04-03 18:20:12],
      calories: 470
    }
  end
end

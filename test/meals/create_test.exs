defmodule MealsReport.Meals.CreateTest do
  alias MealsReport.{Meals, Repo}
  use MealsReport.DataCase, async: true
  import MealsReport.Factory

  describe "call/1" do
    test "returns a meal when valid parameters are passed" do
      response =
         build(:meals_params)
        |>Meals.Create.call()
        assert {:ok,  %Meals{calories: 450, date: _date, description: "Pizza Vegana", id: _id}} = response
    end
  end
end

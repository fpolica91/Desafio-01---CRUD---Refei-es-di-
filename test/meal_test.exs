defmodule MealsReport.MealTest do
  use MealsReport.DataCase, async: true
  import MealsReport.Factory
  alias MealsReport.Meals
  alias Ecto.Changeset

  describe "changeset/2" do
    test "if valid parameters passed returns a changeset" do
    response =
    build(:meals_params)
    |>Meals.changeset()
    assert %Changeset{changes: %{calories: 450, date: _date, description: "Pizza Vegana"}, valid?: true} = response
    end

    test "if invalid params are passed, returns an error" do
      response =
        build(:meals_params, date: "1234")
        |>Meals.changeset()
      assert %{date: ["is invalid"]} == errors_on(response)
    end
  end
end

defmodule MealsReportWeb.MealsViewTest do
  use MealsReportWeb.ConnCase, async: true
  alias MealsReport.Meals
  import Phoenix.View
  import MealsReport.Factory
  alias MealsReportWeb.MealsView

  test "renders meals.json" do
    meals = build(:meals)
    response = render(MealsView, "meals.json", meals: meals)
    assert %{meals: %Meals{calories: 470, date: ~N[2021-04-03 18:20:12], description: "Potatoe Salad"}} = response
  end

end

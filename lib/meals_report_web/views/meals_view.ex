defmodule MealsReportWeb.MealsView do
  use MealsReportWeb, :view
  alias MealsReport.Meals
  def render("meals.json", %{meals: %Meals{} = meals }) do
    %{
      meals: meals
    }
  end

end

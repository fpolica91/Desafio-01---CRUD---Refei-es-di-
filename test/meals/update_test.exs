defmodule MealsReport.Meals.UpdateTest do
  alias MealsReport.{Meals, Repo}
  use MealsReport.DataCase, async: true
  import MealsReport.Factory

  describe "call/1" do
    test "returns a meal with a valid id" do
      id = "f14295b5-cf61-4a9e-8441-b78a7502508b"
      insert(:meals)
      params = %{"id" => "f14295b5-cf61-4a9e-8441-b78a7502508b", "description" =>  "Pepperoni Pizza", "calories" =>  400, "date" =>  ~N[2021-04-03 18:20:12]}
      response = Meals.Update.call(params)
      assert {:ok, %Meals{id: "f14295b5-cf61-4a9e-8441-b78a7502508b", description: "Pepperoni Pizza", calories: 400}} = response
    end
  end
end

defmodule MealsReport.Meals.GetTest do
  alias MealsReport.{Meals, Repo}
  use MealsReport.DataCase, async: true
  import MealsReport.Factory

  describe "by_id/1" do
    test "returns a meal with a valid id" do
      id = "f14295b5-cf61-4a9e-8441-b78a7502508b"
      insert(:meals)
      response =  Meals.Get.by_id(id)
      assert {:ok, %Meals{id: id}} = response
    end
  end
end

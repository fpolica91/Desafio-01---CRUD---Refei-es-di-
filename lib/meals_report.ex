defmodule MealsReport do
  alias MealsReport.Meals.Create, as: MealCreate
  alias MealsReport.Meals.Get, as: MealsGet
  alias MealsReport.Meals.Delete, as: MealsDelete
  alias MealsReport.Meals.Update, as: MealsUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal(id), to: MealsGet, as: :by_id
  defdelegate delete_meal(id), to: MealsDelete, as: :call
  defdelegate update_meal(params), to: MealsUpdate, as: :call

  @moduledoc """
  MealsReport keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
end

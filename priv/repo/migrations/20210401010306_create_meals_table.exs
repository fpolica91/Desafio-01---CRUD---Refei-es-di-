defmodule MealsReport.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals do
      # add :atom, :type
      add :description, :string
      add :date, :naive_datetime
      add :calories, :integer

      timestamps()
    end

  end
end

# add :user_id, references(:users, type: :binary_id)

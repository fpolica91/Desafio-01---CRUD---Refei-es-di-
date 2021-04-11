defmodule MealsReport.Meals do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:description, :date, :calories, :user_id]
  @derive {Jason.Encoder, only: @required_params ++[:id]}


    schema "meals" do
      # field, :name, :type
      field :description, :string
      field :date, :naive_datetime
      field :calories, :integer
      belongs_to :user, MealsReport.User
      timestamps()
    end

    def changeset(struct \\ %__MODULE__{},params) do
      struct
      |>cast(params, @required_params)
      |>validate_required(@required_params)
    end
end

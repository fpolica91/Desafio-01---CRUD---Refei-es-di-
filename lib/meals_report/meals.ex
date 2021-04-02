defmodule MealsReport.Meals do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:description, :date, :calories]
  @derive {Jason.Encoder, only: [:description,:date, :calories, :id]}


    schema "meals" do
      # field, :name, :type
      field :description, :string
      field :date, :naive_datetime
      field :calories, :integer
      timestamps()
    end

    def changeset(struct \\ %__MODULE__{},params) do
      struct
      |>cast(params, @required_params)
      |>validate_required(@required_params)
    end

end

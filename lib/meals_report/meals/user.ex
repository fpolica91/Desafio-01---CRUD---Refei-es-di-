defmodule MealsReport.User  do
  use Ecto.Schema
  import Ecto.Changeset
  alias MealsReport.Meals


  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:cpf,:email, :name]
  @derive {Jason.Encoder, only: [:id,:email, :name, :cpf]}

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string
    has_many :meals, Meals

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |>cast(params, @required_params)
    |> validate_required(@required_params)

  end




end

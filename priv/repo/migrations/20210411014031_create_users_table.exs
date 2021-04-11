defmodule MealsReport.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      # add :atom, :type
      add :name, :string
      add :cpf, :string
      add :email, :string


      timestamps()
    end
  end
end

# {
# 	id: id,
# 	nome: nome,
# 	cpf: cpf,
# 	email: email
# }


# I always get the naming conventions on these wrong, o well
defmodule TestingWithPhoenix.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
      create table(:users) do
        add :name, :string
        add :username, :string
        add :password, :string
      
      timestamps
    end
  end
end

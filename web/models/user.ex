defmodule TestingWithPhoenix.User do
  use TestingWithPhoenix.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :password])
    |> validate_required([:name, :username, :password])
    |> validate_length(:username, max: 20)
  end
end

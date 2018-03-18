defmodule TimeTracker.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TimeTracker.{User, Project}

  @derive {Poison.Encoder, only: [:id, :email]}
  
  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :owned_projects, Project
    
    timestamps()
  end

  @required_fields ~w(email password first_name)a
  @allowed_fields @required_fields

  @email_regex ~r/\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/i

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end

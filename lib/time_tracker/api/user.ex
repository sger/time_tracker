defmodule TimeTracker.Api.User do
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
    |> cast(attrs, @allowed_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, @email_regex)
    |> validate_length(:password, min: 6, max: 100)
    |> validate_confirmation(:password, message: "Password does not match")
    |> unique_constraint(:email, message: "Email already taken")
    |> put_pass_hash()
  end

  def put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end

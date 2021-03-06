defmodule TimeTracker.ProjectUser do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias TimeTracker.{User, Project}

  schema "projects_users" do
    belongs_to :project, Project
    belongs_to :user, User

    timestamps()
  end

  @required_fields ~w(user_id project_id)a
  @optional_fields ~w(user_id project_id)a
  
  @doc false
  def changeset(project_user, attrs) do
    project_user
    |> cast(attrs, @optional_fields)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:project_id)
    |> foreign_key_constraint(:user_id)
  end
end

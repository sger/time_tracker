defmodule TimeTracker.ProjectUser do
  use Ecto.Schema
  import Ecto.Changeset


  schema "projects_users" do

    timestamps()
  end

  @doc false
  def changeset(project_user, attrs) do
    project_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end

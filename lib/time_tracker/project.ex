defmodule TimeTracker.Project do
  use Ecto.Schema
  import Ecto.Changeset


  schema "projects" do

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [])
    |> validate_required([])
  end
end

defmodule TimeTracker.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias TimeTracker.{User, TimeEntry, ProjectUser}

  @derive {Poison.Encoder, only: [:id, :name]}

  schema "projects" do
    field :name, :string
    has_many :time_entries, TimeEntry
    belongs_to :user, User
    has_many :projects_users, ProjectUser
    timestamps()
  end

  @required_fields ~w(name user_id)a
  @allowed_fields @required_fields

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [])
    |> validate_required([])
  end
end

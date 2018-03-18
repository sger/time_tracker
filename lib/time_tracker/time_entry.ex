defmodule TimeTracker.TimeEntry do
  use Ecto.Schema
  import Ecto.Changeset

  alias Timex.Ecto.DateTime
  alias Timex.Date

  @derive {Poison.Encoder, only: [:id, :description, :started_at, :stopped_at, :restarted_at, :duration, :updated_at]}

  schema "time_entries" do
    field :started_at, DateTime
    field :stopped_at, DateTime
    field :restarted_at, DateTime
    field :duration, :integer
    field :description, :string
    belongs_to :project, TimeTracker.Project
    belongs_to :user, TimeTracker.User
    timestamps()
  end

  @required_fields ~w(started_at user_id project_id)a
  @restart_required_fields ~w(restarted_at)a
  @optional_fields ~w(started_at user_id description stopped_at duration project_id restarted_at)a

  @doc false
  def changeset(time_entry, attrs) do
    time_entry
    |> cast(attrs, [])
    |> validate_required([])
  end
end

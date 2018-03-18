defmodule TimeTracker.TimeEntry do
  use Ecto.Schema
  import Ecto.Changeset


  schema "time_entries" do

    timestamps()
  end

  @doc false
  def changeset(time_entry, attrs) do
    time_entry
    |> cast(attrs, [])
    |> validate_required([])
  end
end

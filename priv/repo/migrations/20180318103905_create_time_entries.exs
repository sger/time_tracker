defmodule TimeTracker.Repo.Migrations.CreateTimeEntries do
  use Ecto.Migration

  def change do
    create table(:time_entries) do
      add :started_at, :utc_datetime, null: false
      add :stopped_at, :utc_datetime
      add :description, :text
      add :duration, :integer, default: 0
      add :restarted_at, :utc_datetime, null: true

      add :project_id, references(:projects, on_delete: :delete_all), null: true
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:time_entries, [:project_id])
    create index(:time_entries, [:user_id])
  end
end

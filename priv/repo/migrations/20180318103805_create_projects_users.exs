defmodule TimeTracker.Repo.Migrations.CreateProjectsUsers do
  use Ecto.Migration

  def change do
    create table(:projects_users) do
      add :project_id, references(:projects, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:projects_users, [:project_id])
    create index(:projects_users, [:user_id])
  end
end

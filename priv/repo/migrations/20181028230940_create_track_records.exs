defmodule TrackRecord.Repo.Migrations.CreateTrackRecords do
  use Ecto.Migration

  def change do
    create table(:track_records) do
      add :track_ended, :naive_datetime
      add :track_id, references(:tracks, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:track_records, [:track_id])
    create index(:track_records, [:user_id])
  end
end

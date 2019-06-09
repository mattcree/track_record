defmodule TrackRecord.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :track_name, :string
      add :artist, :string
      add :album, :string
      add :duration_in_secs, :integer

      timestamps()
    end

    create unique_index(
      :tracks, [:track_name, :artist, :album, :duration_in_secs], name: :unique_tracks)
  end
end

defmodule TrackRecord.Music.Track do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tracks" do
    field :album, :string
    field :artist, :string
    field :duration_in_secs, :integer
    field :track_name, :string

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:track_name, :artist, :album, :duration_in_secs])
    |> validate_required([:track_name, :artist, :album, :duration_in_secs])
    |> unique_constraint(:unique_tracks, name: :unique_tracks)
  end
end

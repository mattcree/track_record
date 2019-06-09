defmodule TrackRecord.Music.TrackRecord do
  use Ecto.Schema
  import Ecto.Changeset


  schema "track_records" do
    field :track_ended, :naive_datetime
    field :track_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(track_record, attrs) do
    track_record
    |> cast(attrs, [:track_id, :user_id, :track_ended])
    |> validate_required([:track_id, :user_id, :track_ended])
    |> foreign_key_constraint(:track_id)
    |> foreign_key_constraint(:user_id)
  end
end

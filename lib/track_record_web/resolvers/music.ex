defmodule TrackRecordWeb.Music do
  alias TrackRecord.Music
  alias TrackRecord.Accounts

  def update_now_playing(_, args, _) do
    with {:ok, _user} <- Accounts.get_user(args.user_id) do
      update_now_playing(args)
    else
      error -> error
    end
  end

  defp update_now_playing(args) do
    case Music.get_track_by_track_details(args) do
      {:ok, track} -> Music.create_track_record(args, track)
      {:error, "Track not found"} -> new_track_and_record(args)
      {:error, error} -> {:error, error}
    end
  end

  def get_user_tracks(_, args, _) do
    Music.get_user_tracks(args.user_id)
  end

  defp new_track_and_record(args) do
    with       {:ok, track} <- Music.create_track(args),
        {:ok, track_record} <- Music.create_track_record(args, track)
    do
      {:ok, track_record}
    else
      error -> error
    end
  end
end
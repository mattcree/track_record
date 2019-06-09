defmodule TrackRecord.Music do
  @moduledoc """
  The Music context.
  """

  import Ecto.Query, warn: false
  alias TrackRecord.Repo

  alias TrackRecord.Music.Track

  @doc """
  Returns the list of tracks.

  ## Examples

      iex> list_tracks()
      [%Track{}, ...]

  """
  def list_tracks do
    Repo.all(Track)
  end

  @doc """
  Gets a single track.

  Raises `Ecto.NoResultsError` if the Track does not exist.

  ## Examples

      iex> get_track!(123)
      %Track{}

      iex> get_track!(456)
      ** (Ecto.NoResultsError)

  """
  def get_track!(id), do: Repo.get!(Track, id)


  @doc """
  Gets a single track.

  ## Examples

      iex> get_track_by_track_details(123)
      {:ok, %Track{}}

      iex> get_track_by_track_details(456)
      {:error, message}

  """
  def get_track_by_track_details(args) do
    query = from track in Track, where: track.track_name == ^args.track_name 
    Repo.one(query)
    |> track_result
  end

  defp track_result(nil),   do: {:error, "Track not found"}
  defp track_result(track), do: {:ok, track}
  defp track_result(error), do: error

    @doc """
  Gets a single track.

  ## Examples

      iex> get_track_by_track_details(123)
      {:ok, %Track{}}

      iex> get_track_by_track_details(456)
      {:error, message}

  """
  def get_user_tracks(id) do
    query = from track in Track,
              join: track_record in TrackRecord.Music.TrackRecord, 
                where: track_record.user_id==^id and track.id==track_record.track_id,
                  order_by: [desc: track_record.inserted_at]
    case Repo.all(query) do
        list -> {:ok, list}
    end
  end

  @doc """
  Creates a track.

  ## Examples

      iex> create_track(%{field: value})
      {:ok, %Track{}}

      iex> create_track(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_track(attrs \\ %{}) do
    %Track{}
    |> Track.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a track.

  ## Examples

      iex> update_track(track, %{field: new_value})
      {:ok, %Track{}}

      iex> update_track(track, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_track(%Track{} = track, attrs) do
    track
    |> Track.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Track.

  ## Examples

      iex> delete_track(track)
      {:ok, %Track{}}

      iex> delete_track(track)
      {:error, %Ecto.Changeset{}}

  """
  def delete_track(%Track{} = track) do
    Repo.delete(track)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking track changes.

  ## Examples

      iex> change_track(track)
      %Ecto.Changeset{source: %Track{}}

  """
  def change_track(%Track{} = track) do
    Track.changeset(track, %{})
  end

  alias TrackRecord.Music.TrackRecord

  @doc """
  Returns the list of track_records.

  ## Examples

      iex> list_track_records()
      [%TrackRecord{}, ...]

  """
  def list_track_records do
    Repo.all(TrackRecord)
  end

  @doc """
  Gets a single track_record.

  Raises `Ecto.NoResultsError` if the Track record does not exist.

  ## Examples

      iex> get_track_record!(123)
      %TrackRecord{}

      iex> get_track_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_track_record!(id), do: Repo.get!(TrackRecord, id)

  @doc """
  Creates a track_record.

  ## Examples

      iex> create_track_record(%{field: value})
      {:ok, %TrackRecord{}}

      iex> create_track_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_track_record(args, track) do
    %TrackRecord{}
    |> TrackRecord.changeset(make_track_record(args, track))
    |> Repo.insert()
  end

  defp make_track_record(args, track) do
    %{:user_id => args.user_id, 
      :track_id => track.id, 
      :track_ended => NaiveDateTime.add(NaiveDateTime.utc_now, track.duration_in_secs)}
  end

  @doc """
  Updates a track_record.

  ## Examples

      iex> update_track_record(track_record, %{field: new_value})
      {:ok, %TrackRecord{}}

      iex> update_track_record(track_record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_track_record(%TrackRecord{} = track_record, attrs) do
    track_record
    |> TrackRecord.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TrackRecord.

  ## Examples

      iex> delete_track_record(track_record)
      {:ok, %TrackRecord{}}

      iex> delete_track_record(track_record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_track_record(%TrackRecord{} = track_record) do
    Repo.delete(track_record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking track_record changes.

  ## Examples

      iex> change_track_record(track_record)
      %Ecto.Changeset{source: %TrackRecord{}}

  """
  def change_track_record(%TrackRecord{} = track_record) do
    TrackRecord.changeset(track_record, %{})
  end
end

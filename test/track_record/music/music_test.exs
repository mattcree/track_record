defmodule TrackRecord.MusicTest do
  use TrackRecord.DataCase

  alias TrackRecord.Music

  describe "artists" do
    alias TrackRecord.Music.Artist

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def artist_fixture(attrs \\ %{}) do
      {:ok, artist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Music.create_artist()

      artist
    end

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Music.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Music.get_artist!(artist.id) == artist
    end

    test "create_artist/1 with valid data creates a artist" do
      assert {:ok, %Artist{} = artist} = Music.create_artist(@valid_attrs)
      assert artist.name == "some name"
    end

    test "create_artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_artist(@invalid_attrs)
    end

    test "update_artist/2 with valid data updates the artist" do
      artist = artist_fixture()
      assert {:ok, artist} = Music.update_artist(artist, @update_attrs)
      assert %Artist{} = artist
      assert artist.name == "some updated name"
    end

    test "update_artist/2 with invalid data returns error changeset" do
      artist = artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_artist(artist, @invalid_attrs)
      assert artist == Music.get_artist!(artist.id)
    end

    test "delete_artist/1 deletes the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{}} = Music.delete_artist(artist)
      assert_raise Ecto.NoResultsError, fn -> Music.get_artist!(artist.id) end
    end

    test "change_artist/1 returns a artist changeset" do
      artist = artist_fixture()
      assert %Ecto.Changeset{} = Music.change_artist(artist)
    end
  end

  describe "albums" do
    alias TrackRecord.Music.Album

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Music.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Music.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Music.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Music.create_album(@valid_attrs)
      assert album.name == "some name"
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Music.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.name == "some updated name"
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_album(album, @invalid_attrs)
      assert album == Music.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Music.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Music.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Music.change_album(album)
    end
  end

  describe "tracks" do
    alias TrackRecord.Music.Track

    @valid_attrs %{duration_in_secs: 42, name: "some name"}
    @update_attrs %{duration_in_secs: 43, name: "some updated name"}
    @invalid_attrs %{duration_in_secs: nil, name: nil}

    def track_fixture(attrs \\ %{}) do
      {:ok, track} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Music.create_track()

      track
    end

    test "list_tracks/0 returns all tracks" do
      track = track_fixture()
      assert Music.list_tracks() == [track]
    end

    test "get_track!/1 returns the track with given id" do
      track = track_fixture()
      assert Music.get_track!(track.id) == track
    end

    test "create_track/1 with valid data creates a track" do
      assert {:ok, %Track{} = track} = Music.create_track(@valid_attrs)
      assert track.duration_in_secs == 42
      assert track.name == "some name"
    end

    test "create_track/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_track(@invalid_attrs)
    end

    test "update_track/2 with valid data updates the track" do
      track = track_fixture()
      assert {:ok, track} = Music.update_track(track, @update_attrs)
      assert %Track{} = track
      assert track.duration_in_secs == 43
      assert track.name == "some updated name"
    end

    test "update_track/2 with invalid data returns error changeset" do
      track = track_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_track(track, @invalid_attrs)
      assert track == Music.get_track!(track.id)
    end

    test "delete_track/1 deletes the track" do
      track = track_fixture()
      assert {:ok, %Track{}} = Music.delete_track(track)
      assert_raise Ecto.NoResultsError, fn -> Music.get_track!(track.id) end
    end

    test "change_track/1 returns a track changeset" do
      track = track_fixture()
      assert %Ecto.Changeset{} = Music.change_track(track)
    end
  end

  describe "tracks" do
    alias TrackRecord.Music.Track

    @valid_attrs %{album: "some album", artist: "some artist", duration_in_secs: 42, track_name: "some track_name"}
    @update_attrs %{album: "some updated album", artist: "some updated artist", duration_in_secs: 43, track_name: "some updated track_name"}
    @invalid_attrs %{album: nil, artist: nil, duration_in_secs: nil, track_name: nil}

    def track_fixture(attrs \\ %{}) do
      {:ok, track} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Music.create_track()

      track
    end

    test "list_tracks/0 returns all tracks" do
      track = track_fixture()
      assert Music.list_tracks() == [track]
    end

    test "get_track!/1 returns the track with given id" do
      track = track_fixture()
      assert Music.get_track!(track.id) == track
    end

    test "create_track/1 with valid data creates a track" do
      assert {:ok, %Track{} = track} = Music.create_track(@valid_attrs)
      assert track.album == "some album"
      assert track.artist == "some artist"
      assert track.duration_in_secs == 42
      assert track.track_name == "some track_name"
    end

    test "create_track/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_track(@invalid_attrs)
    end

    test "update_track/2 with valid data updates the track" do
      track = track_fixture()
      assert {:ok, track} = Music.update_track(track, @update_attrs)
      assert %Track{} = track
      assert track.album == "some updated album"
      assert track.artist == "some updated artist"
      assert track.duration_in_secs == 43
      assert track.track_name == "some updated track_name"
    end

    test "update_track/2 with invalid data returns error changeset" do
      track = track_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_track(track, @invalid_attrs)
      assert track == Music.get_track!(track.id)
    end

    test "delete_track/1 deletes the track" do
      track = track_fixture()
      assert {:ok, %Track{}} = Music.delete_track(track)
      assert_raise Ecto.NoResultsError, fn -> Music.get_track!(track.id) end
    end

    test "change_track/1 returns a track changeset" do
      track = track_fixture()
      assert %Ecto.Changeset{} = Music.change_track(track)
    end
  end

  describe "track_records" do
    alias TrackRecord.Music.TrackRecord

    @valid_attrs %{track_ended: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{track_ended: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{track_ended: nil}

    def track_record_fixture(attrs \\ %{}) do
      {:ok, track_record} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Music.create_track_record()

      track_record
    end

    test "list_track_records/0 returns all track_records" do
      track_record = track_record_fixture()
      assert Music.list_track_records() == [track_record]
    end

    test "get_track_record!/1 returns the track_record with given id" do
      track_record = track_record_fixture()
      assert Music.get_track_record!(track_record.id) == track_record
    end

    test "create_track_record/1 with valid data creates a track_record" do
      assert {:ok, %TrackRecord{} = track_record} = Music.create_track_record(@valid_attrs)
      assert track_record.track_ended == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_track_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Music.create_track_record(@invalid_attrs)
    end

    test "update_track_record/2 with valid data updates the track_record" do
      track_record = track_record_fixture()
      assert {:ok, track_record} = Music.update_track_record(track_record, @update_attrs)
      assert %TrackRecord{} = track_record
      assert track_record.track_ended == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_track_record/2 with invalid data returns error changeset" do
      track_record = track_record_fixture()
      assert {:error, %Ecto.Changeset{}} = Music.update_track_record(track_record, @invalid_attrs)
      assert track_record == Music.get_track_record!(track_record.id)
    end

    test "delete_track_record/1 deletes the track_record" do
      track_record = track_record_fixture()
      assert {:ok, %TrackRecord{}} = Music.delete_track_record(track_record)
      assert_raise Ecto.NoResultsError, fn -> Music.get_track_record!(track_record.id) end
    end

    test "change_track_record/1 returns a track_record changeset" do
      track_record = track_record_fixture()
      assert %Ecto.Changeset{} = Music.change_track_record(track_record)
    end
  end
end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TrackRecord.Repo.insert!(%TrackRecord.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
%User{:username => "Barry"} |> TrackRecord.Repo.insert!
%User{:username => "Jimmy"} |> TrackRecord.Repo.insert!
%User{:username => "Bimmy"} |> TrackRecord.Repo.insert!
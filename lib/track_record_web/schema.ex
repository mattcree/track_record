defmodule TrackRecordWeb.Schema do

  
    use Absinthe.Schema
    import_types Absinthe.Type.Custom
  
    alias TrackRecordWeb.Accounts
    alias TrackRecordWeb.Music

    object :user do
      field :id, :id
      field :username, :string
    end

    object :track_record do
      field :inserted_at, :naive_datetime
      field :user_id, :id
      field :track_id, :id
      field :track_ended, :naive_datetime
    end

    object :track do
      field :inserted_at, :naive_datetime
      field :id, :id
      field :track_name, :string
      field :artist, :string
      field :album, :string
      field :duration_in_secs, :integer
    end

    object :track_list do
      field :tracks, list_of(:track)
    end

    query do
      field :all_users, list_of(:user) do
        resolve &Accounts.all_users/3
      end

      field :get_user, :user do
        description "get a user"
        arg :id, non_null(:id)

        resolve &Accounts.get_user/3
      end

      field :get_user_tracks, list_of(:track) do
        arg :user_id, non_null(:id)

        resolve &Music.get_user_tracks/3
      end
    end

    mutation do
      field :create_user, :user do
        arg :username, non_null(:string)
    
        resolve &Accounts.create_user/3
      end

      field :update_now_playing, :track_record do
        arg :user_id, non_null(:id)
        arg :track_name, non_null(:string)
        arg :artist, non_null(:string)
        arg :album, non_null(:string)
        arg :duration_in_secs, non_null(:integer)

        resolve &Music.update_now_playing/3
      end
    end
  end
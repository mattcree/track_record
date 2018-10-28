defmodule TrackRecordWeb.Schema do
    use Absinthe.Schema
  
    alias TrackRecordWeb.AccountsResolver

    object :user do
      field :id, non_null(:id)
      field :username, non_null(:string)
    end
  
    query do
      field :all_users, non_null(list_of(non_null(:user))) do
        resolve &AccountsResolver.all_users/3
      end
    end

    mutation do
      field :create_user, :user do
        arg :username, non_null(:string)
    
        resolve &AccountsResolver.create_user/3
      end
    end
  end
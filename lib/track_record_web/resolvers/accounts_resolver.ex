defmodule TrackRecordWeb.AccountsResolver do
    alias TrackRecord.Accounts
  
    def all_users(_root, _args, _info) do
      {:ok, Accounts.list_users}
    end

    def create_user(_root, args, _info) do
      case Accounts.create_user args do
          {:ok, user} -> {:ok, user}
          _error      -> {:error, "Error creating user"}
      end
    end
  end
defmodule TrackRecordWeb.Accounts do
  alias TrackRecord.Accounts

  def all_users(_, _, _) do
    {:ok, Accounts.list_users}
  end

  def get_user(_root, %{:id => id}, _info) do
    case Accounts.get_user id do
      nil  -> {:error, message: "User with id #{id} not found", code: 404}
      user -> {:ok, user}
    end
  end

  def create_user(_root, args, _info) do
    case Accounts.create_user args do
      {:ok, user} -> {:ok, user}
      _error      -> {:error, "Error creating user"}
    end
  end
end
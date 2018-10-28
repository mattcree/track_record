defmodule TrackRecordWeb.Router do
  use TrackRecordWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: TrackRecordWeb.Schema,
      interface: :simple,
      context: %{pubsub: TrackRecordWeb.Endpoint}
  end
end

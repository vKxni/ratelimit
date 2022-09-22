defmodule RatelimitWeb.Router do
  use RatelimitWeb, :router

  pipeline :api do
    plug RatelimitWeb.Plugs.RateLimiter
    plug :accepts, ["json"]
  end

  scope "/api", RatelimitWeb do
    pipe_through :api

    get "/test", PageController, :index
  end
end

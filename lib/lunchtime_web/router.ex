defmodule LunchtimeWeb.Router do
  use LunchtimeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LunchtimeWeb do
    pipe_through :api

    post "/menus", MenusController, :menus
  end
end

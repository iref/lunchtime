defmodule LunchtimeWeb.MenusController do
  use LunchtimeWeb, :controller

  def menus(conn, params) do
    IO.inspect(params)
    restaurants = Lunchtime.get_restaurants()
    conn
    |> put_status(:ok)
    |> render("restaurants.json", restaurants: restaurants)
  end
end

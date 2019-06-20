defmodule LunchtimeWeb.MenusController do
  use LunchtimeWeb, :controller

  def menus(conn, _params) do
    # TODO handle errors in fallback error controller 
    menus = Lunchtime.get_lunch_menu("16507624")

    conn
    |> put_status(:ok)
    |> render("menus.json", menus: menus)
  end
end

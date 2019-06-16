defmodule LunchtimeWeb.MenusController do
    use LunchtimeWeb, :controller

    def menus(conn, %{"user_id" => user_id, "user_name" => username}) do
        conn
        |> put_status(:ok)
        |> render("menus.text")
    end
end
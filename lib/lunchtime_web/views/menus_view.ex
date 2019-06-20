defmodule LunchtimeWeb.MenusView do
  use LunchtimeWeb, :view

  def render("menus.text", %{menus: menus}) do
    IO.inspect(menus.daily_menus)

    menus.daily_menus
    |> Enum.map(&render_menu/1)
    |> Enum.join("\n")
  end

  defp render_menu(%Lunchtime.Zomato.DailyMenu{name: name, dishes: dishes}) do
    dishes = render_dishes(dishes)
    "#{name}-------------------\n\n#{dishes}\n\n"
  end

  defp render_dishes(dishes), do: Enum.map(dishes, &render_dish/1)

  defp render_dish(%Lunchtime.Zomato.Dish{name: name, price: price}), do: "#{name} - #{price}"
end
defmodule LunchtimeWeb.MenusView do
  use LunchtimeWeb, :view

  def render("restaurants.json", %{restaurants: restaurants}) do
    text = restaurants
      |> Enum.map(&render_restaurant/1)
      |> Enum.join()
    slack_response("Use /lunchtime alias to see restaurant's lunch menu\n\n#{text}")
  end
  def render("menus.json", %{menus: menus}) do
    menus
    |> Enum.map(&render_menu/1)
    |> Enum.join("\n")
    |> slack_response()
  end

  defp slack_response(text), do: %{text: "```#{text}```"}

  defp render_menu(%Lunchtime.Zomato.DailyMenu{name: name, dishes: dishes}) do
    dishes = render_dishes(dishes)
    "#{name}\n-------------------\n\n#{dishes}\n"
  end

  defp render_dishes(dishes) do
    dishes
    |> Enum.map(&render_dish/1)
    |> Enum.join("\n")
  end

  defp render_dish(%Lunchtime.Zomato.Dish{name: name, price: price}), do: "#{name} - #{price}"

  defp render_restaurant(%Lunchtime.Restaurant{name: name, alias: alias}), do: "* #{name} (#{alias})\n"
  defp render_restaurant(restaurant) do
    IO.inspect(restaurant)
    ""
  end
end

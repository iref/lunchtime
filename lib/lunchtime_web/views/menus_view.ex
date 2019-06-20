defmodule LunchtimeWeb.MenusView do
  use LunchtimeWeb, :view

  def render("menus.json", %{menus: menus}) do
    text =
      menus
      |> Enum.map(&render_menu/1)
      |> Enum.join("\n")
    %{text: "```#{text}```"}
  end

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
end

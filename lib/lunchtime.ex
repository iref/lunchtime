defmodule Lunchtime do
  @moduledoc """
  Lunchtime keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Lunchtime.Zomato
  alias Lunchtime.Zomato.DailyMenu

  def get_restaurants(), do: Lunchtime.Restaurants.get_restaurants()

  def get_lunch_menu(restaurant_id) do
    # TODO implement error handling
    restaurant_id
    |> Zomato.get_daily_menus()
    |> transform_to_lunch_menus()
  end

  def transform_to_lunch_menus(%{daily_menus: menus}),
    do: Enum.map(menus, &transform_to_lunch_menu/1)

  def transform_to_lunch_menus(_payload), do: {:error, :invalid_payload}

  def transform_to_lunch_menu(%{daily_menu: daily_menu}),
    do: DailyMenu.from_map(daily_menu)

  def transform_to_lunch_menu(_payload), do: {:error, :invalid_payload}
end

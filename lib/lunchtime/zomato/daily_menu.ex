defmodule Lunchtime.Zomato.DailyMenu do
  alias Lunchtime.Zomato.Dish

  defstruct [
    :daily_menu_id, # string
    :name, # string
    :start_date, # instant
    :end_date, # instant
    :dishes # [Map<String, Dish>]
  ]

  def from_map(map) do
    dishes = Enum.map(map[:dishes], &Dish.from_map/1)
    daily_menu = struct(%Lunchtime.Zomato.DailyMenu{}, map)
    %{daily_menu | dishes: dishes}
  end
end

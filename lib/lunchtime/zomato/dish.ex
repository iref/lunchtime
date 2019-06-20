defmodule Lunchtime.Zomato.Dish do
  defstruct [
    :dish_id,
    :name,
    :price
  ]

  def from_map(%{dish: dish}), do: struct(%Lunchtime.Zomato.Dish{}, dish)
end

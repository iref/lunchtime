defmodule Lunchtime.Restaurants do
  use Agent

  @restaurants_list "priv/data/restaurants.json"

  def start_link(opts) do
    opts = Keyword.put(opts, :name, __MODULE__)
    Agent.start_link(&load_restaurants/0, opts)
  end

  def get_restaurants(), do: Agent.get(__MODULE__, &(&1))

  def find_by_alias(alias) do
    Agent.get(__MODULE__, fn restaurants -> Enum.find(restaurants, &(&1.alias == alias)) end)
  end

  defp load_restaurants() do
    @restaurants_list
    |> File.read!()
    |> Poison.decode!(as: [%Lunchtime.Restaurant{}])
  end
end

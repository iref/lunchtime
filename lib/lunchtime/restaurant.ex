defmodule Lunchtime.Restaurant do
  @derive [Poison.Encoder]

  defstruct [:name, :provider, :provider_id, :alias]
end

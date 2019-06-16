defmodule Lunchtime.Zomato do
    @api_key Application.get_env(:lunchtime, :zomato_api_key)
    @base_url "https://developers.zomato.com/api/v2.1"

    defp api_url(path), do: "#{@base_url}#{path}"

    defp decode(response), do: Poison.decode!(response.body)
    
    def get_daily_menus(restaurant_id) do
        url = api_url("/dailymenu")
        IO.inspect(url)
        url
        |> HTTPotion.get(query: %{res_id: restaurant_id}, headers: [user_key: @api_key])
        |> decode()
    end
end
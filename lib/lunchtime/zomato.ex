defmodule Lunchtime.Zomato do
  @api_key Application.get_env(:lunchtime, :zomato_api_key)
  @base_url "https://developers.zomato.com/api/v2.1"

  def get_daily_menus(restaurant_id) do
    "/dailymenu"
    |> api_url()
    |> HTTPotion.get(query: %{res_id: restaurant_id}, headers: [user_key: @api_key])
    |> decode_response()
  end

  defp api_url(path), do: "#{@base_url}#{path}"

  defp decode_response(%HTTPotion.Response{body: body}) do
    Poison.decode!(body, keys: :atoms!)
  end
end

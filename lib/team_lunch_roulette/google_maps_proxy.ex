defmodule TeamLunchRoulette.GoogleMapsProxy do
  use Tesla

  @behaviour TeamLunchRoulette.Maps

  @google_maps_key Application.get_env :team_lunch_roulette, :google_api_web_service

  @places_textsearch_path "/place/textsearch/json"

  plug Tesla.Middleware.BaseUrl, "https://maps.googleapis.com/maps/api/"
  plug Tesla.Middleware.Query, [key: @google_maps_key]
  plug Tesla.Middleware.JSON
#  plug Tesla.Middleware.DebugLogger

  def places(query) do

    response = get(@places_textsearch_path, query: [query: query])
#    IO.inspect(response)
    case response do
        %{body: %{ "results" => results, "status" => "OK"} , status: 200}    -> {:ok, results}
        %{body: %{ "status" => "ZERO_RESULTS"} , status: 200}                -> {:ok, []}
        %{body: %{ "status" => message } , status: 200 }                     -> {:error, message, 403}
        %{status: status}                                                    -> {:error, "UNEXPECTED_ERROR", status}
     end

  end

#  https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJo7BTXjyjpBIRVYEj9QBUcfs&key=AIzaSyCsVv5H7PRRu1L1pNt5YNUji5PvNb52XUA
# https://developers.google.com/places/web-service/photos
# maybe create custom answer and parse ?
end
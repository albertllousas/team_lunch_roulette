defmodule TeamLunchRoulette.GoogleMapsProxyTest do
  use ExUnit.Case
  @moduledoc """
  Here, we will mock using the provided mocking functionallity in tesla http client
  """

  @google_maps_places_ok_response %Tesla.Env{
    body: %{
      "results" => [
        %{
          "formatted_address" => "Carrer de Tànger, 139, 08018 Barcelona, Spain",
          "geometry" => %{"location" => %{"lat" => 41.40468, "lng" => 2.1954406}},
          "icon" => "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
          "id" => "4a18544b938a764a79debcf6f8a6876d07f5b94e", "name" => "Come Bien",
          "opening_hours" => %{"open_now" => false, "weekday_text" => []},
          "place_id" => "ChIJqcjulzyjpBIRS8rbkJgFHDg",
          "rating" => 4.4,
          "types" => ["meal_takeaway", "restaurant", "food"]
        }
      ],
      "status" => "OK"},
   status: 200
  }

  @google_maps_places_request_denied_response %Tesla.Env{
    body: %{
      "error_message" => "The provided API key is invalid.",
      "html_attributions" => [],
      "results" => [],
      "status" => "REQUEST_DENIED"
    },
    status: 200
  }

  test "should success searching places when gmaps api returns 200 response with status field 'OK'" do

    Tesla.Mock.mock fn
      %{
        method: :get,
        url: "https://maps.googleapis.com/maps/api/place/textsearch/json"
      } -> @google_maps_places_ok_response
    end

    result = TeamLunchRoulette.GoogleMapsProxy.places("some_query")

    assert {:ok, [%{
             "formatted_address" => "Carrer de Tànger, 139, 08018 Barcelona, Spain",
             "geometry" => %{"location" => %{"lat" => 41.40468, "lng" => 2.1954406}},
             "icon" => "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
             "id" => "4a18544b938a764a79debcf6f8a6876d07f5b94e", "name" => "Come Bien",
             "opening_hours" => %{"open_now" => false, "weekday_text" => []},
             "place_id" => "ChIJqcjulzyjpBIRS8rbkJgFHDg",
             "rating" => 4.4,
             "types" => ["meal_takeaway", "restaurant", "food"]
           }]} = result
  end

  test "should success searching places when gmaps api returns 200 response with status field 'ZERO_RESULTS'" do

    Tesla.Mock.mock fn
      %{
        method: :get,
        url: "https://maps.googleapis.com/maps/api/place/textsearch/json"
      } -> %Tesla.Env{body: %{"status" => "ZERO_RESULTS"}, status: 200}
    end

    result = TeamLunchRoulette.GoogleMapsProxy.places("some_query")

    assert {:ok, []} = result
  end

  test "should fail with 403 searching places when gmaps api returns 200 response with status field not 'OK'" do

    Tesla.Mock.mock fn
      %{
        method: :get,
        url: "https://maps.googleapis.com/maps/api/place/textsearch/json"
      } -> @google_maps_places_request_denied_response
    end

    result = TeamLunchRoulette.GoogleMapsProxy.places("some_query")

    assert {:error, "REQUEST_DENIED", 403} = result
  end


  test "should fail searching places when gmaps api returns not success response" do

    Tesla.Mock.mock fn
      %{
        method: :get,
        url: "https://maps.googleapis.com/maps/api/place/textsearch/json"
      } ->  %Tesla.Env{ status: 404 }
    end

    result = TeamLunchRoulette.GoogleMapsProxy.places("some_query")

    assert {:error, "UNEXPECTED_ERROR", 404} = result
  end

end
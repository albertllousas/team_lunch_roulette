defmodule TeamLunchRoulette.TeamsInMongoTest do
  use ExUnit.Case

  alias TeamLunchRoulette.Team
  alias TeamLunchRoulette.TeamsInMongo


  setup_all do
    Mongo.delete_many(:mongo, "teams", %{}, pool: DBConnection.Poolboy)
    :ok
  end

  test "should success creating a team" do

    {:ok, result} = TeamsInMongo.create(%Team{name: "magnet", company: "TW", address: "bcn"})

    assert result.name == "magnet"
    assert result.company == "TW"
    assert result.address == "bcn"
    assert result.key != nil
    
  end


end
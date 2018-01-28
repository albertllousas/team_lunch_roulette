defmodule TeamLunchRoulette do
  @moduledoc """
  TeamLunchRoulette keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.

  https://hexdocs.pm/phoenix/contexts.html

  """
  @doc """
  Models
  """
  defmodule Team do
    defstruct name: "", company: "", address: "", key: ""
    @type t :: %Team{name: String.t, company: String.t, address: String.t, key: String.t}
  end
  @doc """
  Behaviours
  """
  defmodule Teams do
    @callback create(team :: Team.t) :: {:ok, Team.t} | {:error, Error.t}
  end
  @doc """
  Google maps proxy, some calls in google maps are meant to be made on server side, they are not accepting CORS.
  """
  defmodule Maps do
    @callback places(query :: String.t) :: {:ok, [map()]} | {:error, String.t, integer}
  end

end

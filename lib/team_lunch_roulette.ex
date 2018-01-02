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
    defstruct name: "", company: "", address: "", key: nil
  end
  @doc """
  Behaviours
  """
  defmodule Teams do
    @callback create(team :: Team.t) :: {:ok, Team.t} | {:error, Error.t}
  end
end

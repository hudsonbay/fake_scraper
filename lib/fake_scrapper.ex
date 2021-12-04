defmodule FakeScrapper do
  @moduledoc """
  Documentation for `FakeScrapper`.
  """

  @doc """
  For simplicity, this function is just a placeholder and does not
  contain real scraping logic
  """
  def work() do
    1..5
    |> Enum.random()
    |> :timer.seconds()
    |> Process.sleep()
  end
end

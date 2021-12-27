defmodule FakeScrapper do
  @moduledoc """
  Documentation for `FakeScrapper`.
  """
  require Logger

  @doc """
  For simplicity, this function is just a placeholder and does not
  contain real scraping logic. It simulates scraping work
  """
  def work(page) do
    1..5
    |> Enum.random()
    |> :timer.seconds()
    |> Process.sleep()

    IO.puts("Scraping #{page}...")
  end
end

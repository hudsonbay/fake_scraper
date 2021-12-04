defmodule FakeScrapperTest do
  use ExUnit.Case
  doctest FakeScrapper

  test "greets the world" do
    assert FakeScrapper.hello() == :world
  end
end

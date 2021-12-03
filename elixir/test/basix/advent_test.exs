defmodule Basix.AdventTest do
  use ExUnit.Case
  doctest Basix.Advent

  test "greets the world" do
    assert Basix.Advent.hello() == :world
  end
end

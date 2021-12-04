defmodule Basix.Advent.Solutions.Day2 do
  @moduledoc """
  https://adventofcode.com/2021/day/2
  """

  # Initialize atoms
  _ = [:forward, :up, :down]

  def normal(input) do
    import String

    result =
      input
      |> Stream.map(&split/1)
      |> Stream.map(fn [command, arg] -> {to_existing_atom(command), to_integer(arg)} end)
      |> Enum.reduce(%{depth: 0, pos: 0}, fn
        {:forward, len}, acc -> %{acc | pos: acc.pos + len}
        {:up, distance}, acc -> %{acc | depth: acc.depth - distance}
        {:down, distance}, acc -> %{acc | depth: acc.depth + distance}
      end)

    IO.puts(result.depth * result.pos)
  end

  def bonus(input) do
    import String

    result =
      input
      |> Stream.map(&split/1)
      |> Stream.map(fn [command, arg] -> {to_existing_atom(command), to_integer(arg)} end)
      |> Enum.reduce(%{depth: 0, pos: 0, aim: 0}, fn
        {:forward, len}, acc -> %{acc | pos: acc.pos + len, depth: acc.depth + len * acc.aim}
        {:up, distance}, acc -> %{acc | aim: acc.aim - distance}
        {:down, distance}, acc -> %{acc | aim: acc.aim + distance}
      end)

    IO.puts(result.depth * result.pos)
  end
end

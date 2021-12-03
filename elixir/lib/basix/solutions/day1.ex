defmodule Basix.Advent.Solutions.Day1 do
  @moduledoc """
  https://adventofcode.com/2021/day/1
  """
  def normal(_input), do: {:todo}

  def bonus(input) do
    IO.puts input
    input |> Enum.chunk_every(3, 1) |> Enum.map(&Enum.sum/1) |> Enum.each(&IO.puts/1) |> IO.inspect # Enum.chunk_every(2, 1) |> Enum.reduce(fn [a, b], acc -> if a)
  end
end

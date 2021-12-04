defmodule Basix.Advent.Solutions.Day1 do
  @moduledoc """
  https://adventofcode.com/2021/day/1
  """
  def normal(input) do
    input
    |> Stream.map(&(Integer.parse(&1) |> elem(0)))
    |> Enum.chunk_every(2, 1)
    |> Enum.reduce(0, fn
      [a, b], acc when a < b -> acc + 1
      _, acc -> acc
    end)
    |> IO.puts()
  end

  def bonus(input) do
    input
    |> Stream.map(&(Integer.parse(&1) |> elem(0)))
    |> Enum.chunk_every(3, 1)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1)
    |> Enum.reduce(0, fn
      [a, b], acc when a < b ->
        acc + 1

      _, acc ->
        acc
    end)
    |> IO.puts()
  end
end

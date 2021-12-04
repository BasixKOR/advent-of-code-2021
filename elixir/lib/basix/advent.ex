defmodule Basix.Advent do
  @moduledoc """
  Documentation for `Basix.Advent`.
  """

  @spec solutions :: %{integer => {(list -> any), (list -> any)}}
  def solutions do
    alias Basix.Advent.Solutions

    %{
      # day => { normal, bonus }
      1 => {&Solutions.Day1.normal/1, &Solutions.Day1.bonus/1}
    }
  end

  @spec run_solution((list -> any), IO.Stream.t()) :: any
  def run_solution(function, stream) do
    args = stream |> Enum.into([])
    function.(args)
  end
end

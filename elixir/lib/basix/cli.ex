defmodule Basix.Advent.CLI do
  use ExCLI.DSL, escript: true
  import Basix.Advent

  @solutions solutions()

  @moduledoc """
  This module provides a command line interface for Advent of Code.
  It is not intended to be used directly, but rather to be called by escript.
  """

  name("adventcli")
  description("A runner for my solutions of the Advent of Code")

  command :run do
    aliases([:r])
    description("Runs the solution for the given day.")

    long_description("""
    Runs the solution for the given day.
    For bonus solutions, you can also specify 'b' at the end of the day or use the -b option.
    """)

    argument(:day)
    option(:bonus, type: :boolean, default: false, aliases: [:b])
    option(:file, aliases: [:f])

    run context do
      {day, _} = context.day |> Integer.parse()
      bonus = context.bonus || String.ends_with?(context.day, "b")

      function =
        case @solutions[day] do
          {normal, bonus_fn} ->
            if bonus do
              bonus_fn
            else
              normal
            end

          nil ->
            raise ArgumentError, "No solution for day #{day}"
        end

      stream =
        if context[:file] do
          File.stream!(context.file, "r")
        else
          IO.stream()
        end

      case run_solution(function, stream) do
        {:todo} -> raise ArgumentError, "No solution for day #{day}"
      end
    end
  end
end

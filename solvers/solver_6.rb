require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver6
    def solve_a(input, _opts = {})
      arr = input.map(&:strip).map(&:split)
      lines = arr.size
      columns = arr.first.size

      operations = arr.pop

      (0..(columns - 1)).each.reduce(0) do |sum, column|
        op = operations[column]

        line_result = if op == '+'
          add_columns(column, arr, lines)
        else
          multiply_columns(column, arr, lines)
        end

        sum + line_result
      end
    end

    def solve_b(_input, _opts = {})
      14
    end

    def add_columns(column_index, array, line_count)
      (0..(line_count - 2)).reduce(0) do |line_sum, line|
        line_sum + array[line][column_index].to_i
      end
    end

    def multiply_columns(column_index, array, line_count)
      (0..(line_count - 2)).reduce(1) do |line_sum, line|
        line_sum * array[line][column_index].to_i
      end
    end
  end
end

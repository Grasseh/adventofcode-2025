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

    def solve_b(input, _opts = {})
      arr = input.map do |line|
        chars = line.chars
        chars.pop
        chars.join
      end

      lines = arr.size
      columns = arr.first.size

      i = 0
      sum = 0
      op = ''
      numbers = []

      while i <= columns
        if i == columns || arr.all? { |x| x[i] == ' ' }
          line_result = if op == '+'
            numbers.sum
          else
            numbers.reduce(:*)
          end

          sum += line_result
          op = ''
          numbers = []
          i += 1
          next
        end

        number = (0..(lines - 2)).reduce('') do |str, line_index|
          (str + arr[line_index][i]).gsub(' ', '')
        end

        numbers << number.to_i

        if arr[lines - 1][i] != ' '
          op = arr[lines - 1][i]
        end

        i += 1
      end

      sum
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

require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver6
    def solve_a(input, _opts = {})
      array = input.map(&:strip).map(&:split)
      lines = array.size
      columns = array.first.size

      operations = array.pop

      (0..(columns - 1)).each.reduce(0) do |sum, column|
        op = operations[column]

        line_result = if op == '+'
          add_columns(column, array, lines)
        else
          multiply_columns(column, array, lines)
        end

        sum + line_result
      end
    end

    def solve_b(input, _opts = {})
      array = input.map do |line|
        chars = line.chars
        chars.pop
        chars.join
      end

      lines_count = array.size
      columns_count = array.first.size

      column_index = 0
      sum = 0
      operation = ''
      numbers = []

      while column_index <= columns_count
        if (
          column_index == columns_count ||
          array.all? { |x| x[column_index] == ' ' }
        )
          sum += calculate_line(operation, numbers)
          operation = ''
          numbers = []
          column_index += 1
          next
        end

        numbers << get_vertical_number(lines_count, column_index, array)
        operation = get_operation(array, lines_count, column_index, operation)

        column_index += 1
      end

      sum
    end

    def get_operation(array, lines_count, column_index, default)
      if array[lines_count - 1][column_index] == ' '
        default
      else
        array[lines_count - 1][column_index]
      end
    end

    def get_vertical_number(lines_count, column_index, array)
      (0..(lines_count - 2)).reduce('') do |str, line_index|
        (str + array[line_index][column_index]).gsub(' ', '')
      end.to_i
    end

    def calculate_line(operation, numbers)
      if operation == '+'
        numbers.sum
      else
        numbers.reduce(:*)
      end
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

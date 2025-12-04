require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver4
    def solve_a(input, _opts = {})
      y_size = input.size
      x_size = input.first.strip.size
      roll_neighbors = [0] * x_size * y_size
      roll_indexes = []

      input.each_with_index do |row, y_index|
        row.strip.chars.each_with_index do |char, x_index|
          next if char == '.'

          roll_indexes << index_1d(x_index, y_index, x_size)

          roll_neighbors = add_roll_neighbors(
            roll_neighbors,
            x_index,
            y_index,
            x_size,
            y_size
          )
        end
      end

      roll_indexes.select { |x| roll_neighbors[x] < 4}.count
    end

    def solve_b(_input, _opts = {})
      6
    end

    def index_1d(x_index, y_index, x_size)
      x_index + y_index * x_size
    end

    def add_roll_neighbors(roll_neighbors, x_index, y_index, x_size, y_size)
      above_y = y_index - 1
      below_y = y_index + 1
      left_x = x_index - 1
      right_x = x_index + 1

      [
        [left_x, above_y],
        [left_x, below_y],
        [left_x, y_index],
        [x_index, above_y],
        [x_index, below_y],
        [right_x, above_y],
        [right_x, below_y],
        [right_x, y_index]
      ].each do |x, y|
        roll_neighbors = add_roll_neighbor(roll_neighbors, x, y, x_size, y_size)
      end

      roll_neighbors
    end

    def add_roll_neighbor(roll_neighbors, x_index, y_index, x_size, y_size)
      return roll_neighbors if x_index.negative?
      return roll_neighbors if y_index.negative?
      return roll_neighbors if x_index >= x_size
      return roll_neighbors if y_index >= y_size

      roll_neighbors[index_1d(x_index, y_index, x_size)] += 1
      roll_neighbors
    end
  end
end

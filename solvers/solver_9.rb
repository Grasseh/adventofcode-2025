require 'active_support'
require 'active_support/core_ext'
require 'matrix'
require 'pry'

module Solvers
  class Solver9
    def solve_a(input, _opts = {})
      input = input.map do |row|
        row.strip.split(',').map(&:to_i)
      end

      areas = []

      input.each_with_index do |line, line_index|
        ((line_index + 1)..(input.size - 1)).each do |pair_index|
          areas << {
            first: line_index,
            second: pair_index,
            area: area(
              line, input[pair_index]
            )
          }
        end
      end

      areas = areas.sort_by { |x| x.dig(:area) }
      areas.last.dig(:area)
    end

    def area(set1, set2)
      v = Vector[set1[0], set1[1]] - Vector[set2[0], set2[1]]
      ((v[0]) + 1).abs * ((v[1]) + 1).abs
    end

    def solve_b(_input, _opts = {})
      9
    end
  end
end

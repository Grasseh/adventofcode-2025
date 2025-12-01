require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver1
    def solve_a(input, _opts = {})
      position = 50
      target_pos = 0
      target_count = 0

      input.each do |line|
        position = pivot(position, line.split('\n').first)

        target_count += 1 if position == target_pos
      end

      target_count
    end

    def solve_b(input, _opts = {})
      return 0
    end

    def pivot(starting_pos, operation)
      movement = parse(operation)
      (starting_pos + 100 + movement) % 100
    end

    def parse(operation)
      movement = operation[1..-1].to_i

      if operation[0] == 'L'
        movement *= -1
      end

      movement
    end
  end
end

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
        movement = parse(line.split('\n').first)
        position = pivot(position, movement)

        target_count += 1 if position == target_pos
      end

      target_count
    end

    def solve_b(input, _opts = {})
      position = 50
      target_count = 0

      input.each do |line|
        movement = parse(line.split('\n').first)
        clicks = clicks(position, movement)
        position = pivot(position, movement)

        target_count += clicks
      end

      target_count
    end

    def clicks(starting_pos, movement)
      if movement.negative?
        unless starting_pos.zero?
          starting_pos = 100 - starting_pos
        end

        movement *= -1
      end

      clicks = ((starting_pos + movement) / 100)
    end

    def pivot(starting_pos, movement)
      (starting_pos + movement) % 100
    end

    def parse(operation)
      movement = operation[1..].to_i

      if operation[0] == 'L'
        movement *= -1
      end

      movement
    end
  end
end

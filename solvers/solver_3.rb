require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver3
    def solve_a(input, _opts = {})
      solve(2, input)
    end

    def solve_b(input, _opts = {})
      solve(12, input)
    end

    def solve(battery_count, input)
      input.reduce(0) do |sum, line|
        sum + highest_joltage(line.strip, battery_count)
      end
    end

    def highest_joltage(line, battery_count)
      biggests = ["0"] * battery_count

      line.chars.each do |char|
        inserted = false

        (1..battery_count - 1).each do |index|
          previous = biggests[index - 1]
          current = biggests[index]

          next unless current > previous

          biggests[index - 1..battery_count - 2] = biggests[index..battery_count - 1]
          biggests[battery_count - 1] = char
          inserted = true
          break
        end

        next if inserted
        next unless char > biggests.last

        biggests[battery_count - 1] = char
      end

      biggests.join.to_i
    end
  end
end

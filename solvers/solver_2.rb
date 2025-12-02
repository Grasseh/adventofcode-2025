require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver2
    def solve_a(input, _opts = {})
      solve(input) do |divisible, size|
        divisible == 2 && (size % divisible).zero?
      end
    end

    def solve_b(input, _opts = {})
      solve(input) do |divisible, size|
        (size % divisible).zero?
      end
    end

    def solve(input, &)
      sum = 0

      input.first.strip.split(',').each do |identifiers|
        identifiers = identifiers.split('-')

        range = (identifiers.first.to_i..identifiers.second.to_i)

        range.each do |identifier|
          size = Math.log10(identifier).ceil

          divisibles = (2..size).select { |divisible| yield(divisible, size) }

          if divisibles.any? { |divisible| sequence?(divisible, identifier) }
            sum += identifier
          end
        end
      end

      sum
    end

    def sequence?(divisible, identifier)
      groups = identifier.to_s.chars.in_groups(divisible).to_a.map(&:join)
      groups.all? { |x| x == groups[0] }
    end
  end
end

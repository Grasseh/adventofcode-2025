require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver2
    def solve_a(input, _opts = {})
      sum = 0
      input.first.strip.split(',').each do |identifiers|
        identifiers = identifiers.split('-')

        range = (identifiers.first.to_i..identifiers.second.to_i)

        range.each do |identifier|
          size = Math.log10(identifier).ceil

          if size.odd?
            next
          end

          top_half = get_top_half(identifier, size)
          bottom_half = get_bottom_half(identifier, size, top_half)

          next unless top_half == bottom_half

          sum = add_id(top_half, sum)
        end
      end

      sum
    end

    def get_top_half(number, size)
      number / (10 ** (size / 2))
    end

    def get_bottom_half(number, size, top_half)
      number - top_half * (10 ** (size / 2))
    end

    def add_id(range, sum)
      sum + "#{range}#{range}".to_i
    end
  end
end

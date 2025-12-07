require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver7
    def solve_a(input, _opts = {})
      split = 0
      beams = {}

      input.map(&:strip).each do |line|
        line.chars.each_with_index do |char, index|
          next if char == '.'

          if char == 'S'
            beams[index] ||= true
            next
          end

          next unless beams[index]

          split += 1
          beams[index] = false

          beams[index - 1] ||= true
          beams[index + 1] ||= true
        end
      end

      split
    end

    def solve_b(_input, _opts = {})
      7
    end
  end
end

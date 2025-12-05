require 'active_support'
require 'active_support/core_ext'
require 'pry'

module Solvers
  class Solver5
    def solve_a(input, _opts = {})
      ids = []
      blank_line_encountered = false
      good = 0

      input.map(&:strip).each do |line|
        if line == ''
          blank_line_encountered = true
          next
        end

        unless blank_line_encountered
          id_a, id_b = line.split('-').map(&:to_i)
          ids << [id_a, id_b]
          next
        end

        good += 1 if good?(ids, line.to_i)
      end

      good
    end

    def solve_b(_input, _opts = {})
      6
    end

    def good?(goods, id)
      goods.any? do |id_a, id_b|
        id.between?(id_a, id_b)
      end
    end
  end
end

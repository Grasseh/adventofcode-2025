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

    def solve_b(input, _opts = {})
      ids = []

      input.map(&:strip).each do |line|
        if line == ''
          break
        end

        id_a, id_b = line.split('-').map(&:to_i)
        ids << [id_a, id_b]
      end

      ids = ids.sort_by(&:first)
      ids = clean_overlaps(ids)

      ids.reduce(0) do |sum, (id_a, id_b)|
        sum + id_b - id_a + 1
      end
    end

    def good?(goods, id)
      goods.any? do |id_a, id_b|
        id.between?(id_a, id_b)
      end
    end

    def clean_overlaps(ids)
      i = 1

      while i < ids.size
        current_range = ids[i]
        previous_range = ids[i - 1]

        if current_range.first > previous_range.last
          # No overlap
          i += 1
          next
        end

        if current_range.last < previous_range.last
          # Already all in overlap
          ids.delete_at(i)
          next
        end

        previous_range[1] = current_range[1]
        ids.delete_at(i)
      end

      ids
    end
  end
end

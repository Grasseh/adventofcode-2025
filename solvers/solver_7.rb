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

    def solve_b(input, _opts = {})
      beams = {}

      input.first.strip.chars.each_with_index do |_value, index|
        beams[index] = 0
      end

      input.map(&:strip).each_with_index do |line, line_index|
        line.chars.each_with_index do |char, index|
          next if char == '.'

          if char == 'S'
            beams[index] = 1
            next
          end

          next unless beams[index]

          beam_count = beams[index]
          beams[index] = 0

          beams[index - 1] += beam_count
          beams[index + 1] += beam_count
        end

        next if line_index.odd?
        next if line_index.zero?
      end

      beams.values.sum
    end
    # Unoptimized recursive
    # def solve_b(input, _opts = {})
    #   line_index = 0

    #   lines = input.map(&:strip)
    #   beam_index = lines[0].index('S')

    #   progress_down(input, line_index, beam_index)
    # end

    # def progress_down(input, line_index, beam_index)
    #   line_index += 1

    #   if line_index == input.size - 1
    #     return 1
    #   end

    #   if input[line_index][beam_index] == '.'
    #     return progress_down(input, line_index, beam_index)
    #   end

    #   (
    #     progress_down(input, line_index, beam_index - 1) +
    #     progress_down(input, line_index, beam_index + 1)
    #   )
    # end
  end
end

require 'active_support'
require 'active_support/core_ext'
require 'matrix'
require 'pry'

module Solvers
  class Solver8
    def solve_a(input, opts = {})
      connections = opts.fetch(:connections, 1000)

      input = input.map do |row|
        row.strip.split(',').map(&:to_i)
      end

      distances = []

      input.each_with_index do |line, line_index|
        ((line_index + 1)..(input.size - 1)).each do |pair_index|
          distances << {
            first: line_index,
            second: pair_index,
            squared_distance: squared_distance(
              line, input[pair_index]
            )
          }
        end
      end

      distances = distances.sort_by { |x| x.dig(:squared_distance) }
      distances = distances[0..(connections - 1)]

      circuits = input.each_with_index.map { |_, index| [index] }

      distances.each do |distance|
        short_circuits = circuits.select do |circuit|
          circuit.include?(distance.dig(:first)) ||
            circuit.include?(distance.dig(:second))
        end

        next if short_circuits.size == 1

        circuits.delete(short_circuits[0])
        circuits.delete(short_circuits[1])
        circuits << short_circuits[0] + short_circuits[1]
      end

      circuits = circuits.sort_by(&:size).reverse
      circuits[0].size * circuits[1].size * circuits[2].size
    end

    def squared_distance(set1, set2)
      (
        Vector[set1[0], set1[1], set1[2]] - Vector[
          set2[0], set2[1], set2[2]
        ]
      ).magnitude
    end

    def solve_b(input, _opts = {})
      input = input.map do |row|
        row.strip.split(',').map(&:to_i)
      end

      distances = []

      input.each_with_index do |line, line_index|
        ((line_index + 1)..(input.size - 1)).each do |pair_index|
          distances << {
            first: line_index,
            second: pair_index,
            squared_distance: squared_distance(
              line, input[pair_index]
            )
          }
        end
      end

      distances = distances.sort_by { |x| x.dig(:squared_distance) }

      circuits = input.each_with_index.map { |_, index| [index] }

      latest_short_circuit = { first: 0, second: 0 }
      distance_index = 0

      loop do
        distance = distances[distance_index]
        distance_index += 1

        short_circuits = circuits.select do |circuit|
          circuit.include?(distance.dig(:first)) ||
            circuit.include?(distance.dig(:second))
        end

        next if short_circuits.size == 1

        circuits.delete(short_circuits[0])
        circuits.delete(short_circuits[1])
        circuits << short_circuits[0] + short_circuits[1]
        latest_short_circuit = distance

        break if circuits.size == 1
      end

      input[latest_short_circuit.dig(:first)].first *
        input[latest_short_circuit.dig(:second)].first
    end
  end
end

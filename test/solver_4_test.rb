require_relative '../solvers/solver_4'
require_relative 'test_helper'

module Tests
  class Solver4Test < Minitest::Test
    def setup
      @solver = Solvers::Solver4.new
    end

    def example_a
      %w(
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
      )
    end

    def test_problem_a
      expected = 13

      assert_equal(
        expected,
        @solver.solve_a(wrap_array_input(*example_a))
      )
    end

    def test_problem_b
      expected = 43

      assert_equal(
        expected,
        @solver.solve_b(wrap_array_input(*example_a))
      )
    end
  end
end

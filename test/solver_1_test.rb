require_relative '../solvers/solver_1'
require_relative 'test_helper'

module Tests
  class Solver1Test < Minitest::Test
    def setup
      @solver = Solvers::Solver1.new
    end

    def example_a
      %w(
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L8
      )
    end

    def test_problem_a
      expected = 3

      assert_equal(
        expected,
        @solver.solve_a(wrap_array_input(*example_a))
      )
    end

    def test_problem_b
      expected = 6

      assert_equal(
        expected,
        @solver.solve_b(wrap_array_input(*example_a))
      )
    end
  end
end

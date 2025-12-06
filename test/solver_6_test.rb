require_relative '../solvers/solver_6'
require_relative 'test_helper'

module Tests
  class Solver6Test < Minitest::Test
    def setup
      @solver = Solvers::Solver6.new
    end

    def example_a
      [
        '123 328  51 64',
        '45 64  387 23',
        '6 98  215 314',
        '*   +   *   +'
      ]
    end

    def test_problem_a
      expected = 4277556

      assert_equal(
        expected,
        @solver.solve_a(wrap_array_input(*example_a))
      )
    end

    def test_problem_b
      expected = 14

      assert_equal(
        expected,
        @solver.solve_b(wrap_array_input(*example_a))
      )
    end
  end
end

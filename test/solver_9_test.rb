require_relative '../solvers/solver_9'
require_relative 'test_helper'

module Tests
  class Solver9Test < Minitest::Test
    def setup
      @solver = Solvers::Solver9.new
    end

    def example_a
      [
        '7,1',
        '11,1',
        '11,7',
        '9,7',
        '9,5',
        '2,5',
        '2,3',
        '7,3'
      ]
    end

    def test_problem_a
      expected = 50

      assert_equal(
        expected,
        @solver.solve_a(wrap_array_input(*example_a))
      )
    end

    def test_problem_b
      expected = 9

      assert_equal(
        expected,
        @solver.solve_b(wrap_array_input(*example_a))
      )
    end
  end
end

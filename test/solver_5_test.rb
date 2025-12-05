require_relative '../solvers/solver_5'
require_relative 'test_helper'

module Tests
  class Solver5Test < Minitest::Test
    def setup
      @solver = Solvers::Solver5.new
    end

    def example_a
      [
        '3-5',
        '10-14',
        '16-20',
        '12-18',
        '',
        '1',
        '5',
        '8',
        '11',
        '17',
        '32'
      ]
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

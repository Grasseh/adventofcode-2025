require_relative '../solvers/solver_2'
require_relative 'test_helper'

module Tests
  class Solver2Test < Minitest::Test
    def setup
      @solver = Solvers::Solver2.new
    end

    def example_a
      [
        '11-22,',
        '95-115,',
        '998-1012,',
        '1188511880-1188511890,',
        '222220-222224,',
        '1698522-1698528,',
        '446443-446449,',
        '38593856-38593862,',
        '565653-565659,',
        '824824821-824824827,',
        '2121212118-2121212124'
      ]
    end

    def test_problem_a
      expected = 1227775554

      assert_equal(
        expected,
        @solver.solve_a(wrap_line_input(example_a.join))
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

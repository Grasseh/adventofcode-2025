require_relative '../solvers/solver_7'
require_relative 'test_helper'

module Tests
  class Solver7Test < Minitest::Test
    def setup
      @solver = Solvers::Solver7.new
    end

    def example_a
      [
        '.......S.......',
        '...............',
        '.......^.......',
        '...............',
        '......^.^......',
        '...............',
        '.....^.^.^.....',
        '...............',
        '....^.^...^....',
        '...............',
        '...^.^...^.^...',
        '...............',
        '..^...^.....^..',
        '...............',
        '.^.^.^.^.^...^.',
        '...............'
      ]
    end

    def test_problem_a
      expected = 21

      assert_equal(
        expected,
        @solver.solve_a(wrap_array_input(*example_a))
      )
    end

    def test_problem_b
      expected = 40

      assert_equal(
        expected,
        @solver.solve_b(wrap_array_input(*example_a))
      )
    end
  end
end

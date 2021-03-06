require_relative '../test_helper'
require 'exercism/iteration'

class IterationTest < Minitest::Test
  # rubocop:disable Metrics/MethodLength
  def test_nix_files
    solution = {
      'ruby/one/file.rb' => 'puts "ok"',
      'ruby/one/some/subdirectory/file2.rb' => 'two = 2',
    }
    iteration = Iteration.new(solution, 'ruby', 'one')
    assert_equal 'ruby', iteration.track_id
    assert_equal 'one', iteration.slug

    expected_solution = {
      'file.rb' => 'puts "ok"',
      'some/subdirectory/file2.rb' => 'two = 2',
    }
    assert_equal expected_solution, iteration.solution
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def test_win_files
    solution = {
      'ruby\one\file.rb' => 'puts "ok"',
      'ruby\one\some\subdirectory\file2.rb' => 'two = 2',
    }
    iteration = Iteration.new(solution, 'ruby', 'one')
    assert_equal 'ruby', iteration.track_id
    assert_equal 'one', iteration.slug

    expected_solution = {
      'file.rb' => 'puts "ok"',
      'some/subdirectory/file2.rb' => 'two = 2',
    }
    assert_equal expected_solution, iteration.solution
  end
  # rubocop:enable Metrics/MethodLength
end

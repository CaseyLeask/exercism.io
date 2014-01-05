require './test/test_helper'
require 'faker'
require 'seed/attempt'
require 'seed/comment'
require 'exercism/code'

class Seed::AttemptTest < MiniTest::Unit::TestCase
  def now
    @now ||= Time.now
  end

  def test_attempt_attributes
    attempt = Seed::Attempt.new('ruby', 'word-count', now, 'pending')
    user = Object.new
    attributes = {
      slug: 'word-count',
      language: 'ruby',
      created_at: now,
      state: 'pending',
      code: 'CODE',
      filename: 'word-count.rb',
      user: user
    }
    assert_equal attributes, attempt.by(user)
  end

  def test_completed_p
    attempt = Seed::Attempt.new('ruby', 'word-count', now)

    attempt.state = 'pending'
    refute attempt.completed?

    attempt.state = 'done'
    assert attempt.completed?
  end

  def test_attempt_comments
    5.times do
      attempt = Seed::Attempt.new('ruby', 'word-count', now, 'pending')
      if attempt.comments.size > 1
        first = attempt.comments.first
        last = attempt.comments.last
        assert first.created_at < last.created_at
      end
    end
  end
end


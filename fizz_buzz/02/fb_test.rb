require 'minitest'
require 'minitest/reporters'
require_relative 'fb'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class FBTest < Minitest::Test
  def setup
    @fb = FB.new
  end

  def test_fizzbuzz
    [
      [1, 1],
      [2, 2],
      [3, 'fizz'],
      [4, 4],
      [5, 'buzz'],
      [15, 'fizzbuzz'],
      [25, 'buzz'],
      [9, 'fizz'],
    ].each do |number, code|
      assert_equal code, @fb.generate(number)
    end
  end
end

Minitest.autorun

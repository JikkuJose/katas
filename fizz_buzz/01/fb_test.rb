require 'minitest'
require 'minitest/reporters'
require_relative 'fb'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class FizzBuzzTEST < Minitest::Test
  def setup
    @fb = FizzBuzz.new
  end

  def test_fizzbuzz
    [
      [1, 1],
      [2, 2],
      [3, 'fizz'],
      [4, 4],
      [5, 'buzz'],
      [15, 'fizzbuzz']
    ].each do |number, result|
      assert_equal result, @fb.fizz_buzz(number)
    end
  end
end

Minitest.autorun

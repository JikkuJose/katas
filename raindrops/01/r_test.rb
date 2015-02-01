require 'minitest'
require 'minitest/reporters'
require_relative 'r'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class RDTest < Minitest::Test
  def setup
    @rd = RainDrops.new
  end

  def test_sound
    [
      [1, 1],
      [2, 2],
      [3, 'Pling'],
      [5, 'Plang'],
      [7, 'Plong'],
      [28, 'Plong'],
      [1755, 'PlingPlang']
    ].each do |number, output|
      assert_equal output, @rd.make_sound(number)
    end
  end
end

Minitest.autorun

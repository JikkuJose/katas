require 'minitest'
require 'minitest/reporters'
require_relative 'bc'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

TEST_DATA = [
  ["129","0123456789","01", "10000001"],
  ["FF","0123456789ABCDEF","0123456789", "255"],
  ["svip","abcdefghijklmnopqrstuvwxyz","0123456789ABCDEF", "50C23"],
]

class BCTest < Minitest::Test
  def setup
  end

  def test_required_signature
    TEST_DATA.each do |input, source_alphabets, target_alphabets, output|
      assert_equal output, BaseConverter.convert(input, source_alphabets, target_alphabets)
    end
  end
end

Minitest.autorun

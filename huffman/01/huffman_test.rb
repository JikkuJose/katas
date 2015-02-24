require 'minitest'
require 'minitest/reporters'
require_relative 'huffman'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({detailed_skip: false})]

class HuffmanTest < Minitest::Test
  def setup
    @probabilities = {a: 0.25, b: 0.5, c: 0.25}
    @code = {a: "10", b: "0", c: "11"}

    @h = Huffman.new symbol_probabilities: @probabilities
  end

  def test_code_generation
    assert_equal @code, @h.code
  end
end

Minitest.autorun

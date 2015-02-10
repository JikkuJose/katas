require 'minitest'
require 'minitest/reporters'
require_relative 'cc'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class CCTest < Minitest::Test
  def setup
  end

  def test_simple_sentences
    [
      ["What a string!", 5, "Bmfy f xywnsl!"]
    ].each do |plain, shift, cipher|
      assert_equal cipher, CaesarCipher.cipher(plain, shift)
    end
  end
end

Minitest.autorun

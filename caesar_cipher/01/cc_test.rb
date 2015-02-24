require 'minitest'
require 'minitest/reporters'
require_relative 'cc'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class CCTest < Minitest::Test
  CODES = [
    ["What a string!", 5, "Bmfy f xywnsl!"],
    ["Thats COOL! WILL ZEBRA go to zoos?", 12, "Ftmfe OAAX! IUXX LQNDM sa fa laae?"],
  ]

  def setup
  end

  def test_encrypt
    CODES.each do |plain, shift, cipher|
      assert_equal cipher, CaesarCipher.new(shift: shift).encrypt(plain)
    end
  end

  def test_decrypt
    CODES.each do |plain, shift, cipher|
      assert_equal plain, CaesarCipher.new(shift: shift).decrypt(cipher)
    end
  end
end

Minitest.autorun

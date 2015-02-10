module CASE_WRAP
  def cyclic_next!
    if self == 'z'
      replace 'a'
      return
    end

    if self == 'Z'
      replace 'A'
      return
    end

    self.next!
  end

  def shift(number)
    number.times { self.cyclic_next! }
    self
  end
end

class CaesarCipher
  def self.cipher(message, shift)
    CaesarCipher.new(shift: shift)
      .encrypt message
  end

  def initialize(shift: 0)
    @shift = shift
  end

  def encrypt(message)
    message.gsub(/\w/) do |character|
      character.extend(CASE_WRAP)
        .shift @shift
    end
  end
end

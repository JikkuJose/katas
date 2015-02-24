module StringRotator
  def rotate(shift)
    (self * 3)[self.length + shift, self.length]
  end
end

class CaesarCipher
  ALPHABETS = "a-zA-Z"

  def self.cipher(message, shift)
    CaesarCipher.new(shift: shift).encrypt message
  end

  def initialize(shift: 0)
    @shift = shift
  end

  def encrypt(message)
    shift(text: message, direction: :positive)
  end

  def decrypt(cipher)
    shift(text: cipher, direction: :negative)
  end

  private

  def shift(text: "", direction: :positive)
    shift_with_direction = @shift * (direction == :positive ? 1 : -1)
    text.tr ALPHABETS, rotated_alphabets(shift_with_direction)
  end

  def rotated_alphabets(shift)
    ('a'..'z').to_a.join.extend(StringRotator).rotate(shift) +
    ('A'..'Z').to_a.join.extend(StringRotator).rotate(shift)
  end
end

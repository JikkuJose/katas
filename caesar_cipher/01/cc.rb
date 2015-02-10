class String
  def next_in_same_case
    return 'a' if self == 'z'
    return 'A' if self == 'Z'

    self.next
  end
end

class CaesarCipher
  def self.cipher(message, shift)
    CaesarCipher.new(shift: shift).encrypt(message)
  end

  def initialize(shift: 0)
    @shift = shift
  end

  def encrypt(message)
    message.gsub(/\w/) do |character|
      @shift.times.inject(character) { |shifter, _| shifter.next_in_same_case }
    end
  end
end

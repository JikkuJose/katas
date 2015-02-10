class String
  def succ_in_same_case
    return 'a' if self == 'z'
    return 'A' if self == 'Z'

    succ
  end
end

class CC
  def self.cipher(message, shift)
    CC.new(shift: shift).encrypt(message)
  end

  def initialize(shift: 0)
    @shift = shift
  end

  def encrypt(message)
    message.gsub(/\w/) do |character|
      @shift.times.inject(character) { |shifter, _| shifter.succ_in_same_case }
    end
  end
end

class Base
  attr_reader :alphabets

  def initialize(alphabets)
    @alphabets = alphabets
  end

  def base
    @alphabets.length
  end

  def zero
    @alphabets[0]
  end

  def to_decimal(number)
    number.reverse.chars.each_with_index.inject(0) do |decimal, (digit, position)|
      coiefficient = @alphabets.index(digit)
      decimal + (coiefficient * base**position)
    end
  end

  def from_decimal(decimal)
    current_number = decimal
    hash = Hash.new(zero)

    until current_number == 0
      position = Math.log(current_number, base).floor
      coiefficient = current_number / base**position
      hash[position] = @alphabets[coiefficient]
      current_number -= coiefficient * base**position
    end

    hash.keys.max.downto(0).each_with_object("") do |position, output|
      output << hash[position].to_s
    end
  end
end

class BaseConverter
  def initialize(source_alphabets, target_alphabets)
    @source = Base.new source_alphabets
    @target = Base.new target_alphabets
  end

  def convert(number)
    @target.from_decimal @source.to_decimal number
  end

  def self.convert(input, source_alphabets, target_alphabets)
    new(source_alphabets, target_alphabets).convert input
  end
end

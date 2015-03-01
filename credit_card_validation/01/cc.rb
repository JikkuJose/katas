class CreditCard
  VALID_LENGTH_RANGE = 12..17

  def initialize(number)
    @number = number.to_s
  end

  def valid?
    valid_length? && check_sum_match?
  end

  private

  def valid_length?
    VALID_LENGTH_RANGE.include? @number.length
  end

  def check_sum_match?
    check_sum.end_with? check_digit
  end

  def check_sum
    digits = check_less_number
             .reverse
             .each_char
             .each_with_index
             .map do |character, index|
      digit = character.to_i
      index.even? ? double_and_sum(digit) : digit
    end

    digits.reduce(:+).to_s
  end

  def check_less_number
    @number[0..-2]
  end

  def check_digit
    @number[-1]
  end

  def double_and_sum(digit)
    double = digit * 2
    tens = double / 10
    units = double % 10

    tens + units
  end
end

class FizzBuzz
  def fizz_buzz number
    case number
    when multiple_of(15)
      'fizzbuzz'
    when multiple_of(5)
      'buzz'
    when multiple_of(3)
      'fizz'
    else
      number
    end
  end

  def multiple_of number
    lambda { |x| x % number == 0 }
  end
end

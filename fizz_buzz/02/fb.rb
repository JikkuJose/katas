class FB
  def generate(number)
    case number
    when multiple_of(15)
      'fizzbuzz'
    when multiple_of(3)
      'fizz'
    when multiple_of(5)
      'buzz'
    else
      number
    end
  end

  def multiple_of(number)
    ->(n) { n % number == 0 }
  end
end

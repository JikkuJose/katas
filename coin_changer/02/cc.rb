class CC
  DENOMINATIONS = [0.50, 0.25, 0.1, 0.05]

  def change amount
    DENOMINATIONS.each_with_object([]) do |coin, coins|
      while amount >= coin
        coins << coin
        amount = (amount - coin).round 2
      end
    end
  end
end

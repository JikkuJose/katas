class CC
  COINS = [5, 2, 1, 0.5, 0.25]
  def change(amount)
    coins = []
    COINS.each do |coin|
      while amount >= coin
        coins << coin
        amount -= coin
      end
    end
    coins
  end
end

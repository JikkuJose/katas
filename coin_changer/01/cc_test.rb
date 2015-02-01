require 'minitest'
require 'minitest/reporters'
require_relative './cc'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class CCTest < Minitest::Test
  def setup
    @cc = CC.new
  end

  def test_coin_changing
    [
      [1, [1]],
      [1.25, [1, 0.25]],
      [2.25, [2, 0.25]],
      [7.5, [5, 2, 0.5]]
    ].each do |amount, coins|
      assert_equal coins, @cc.change(amount)
    end
  end
end

Minitest.autorun

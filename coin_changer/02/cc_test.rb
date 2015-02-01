require 'minitest'
require 'minitest/reporters'
require_relative 'cc'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class CCTest < Minitest::Test
  def setup
    @cc = CC.new
  end

  def test_change
    [
      [[0.05], 0.05],
      [[0.05], 0.05],
      [[0.10], 0.10],
      [[0.10, 0.05], 0.15],
      [[0.25], 0.25],
      [[0.25, 0.050], 0.30],
      [[0.25, 0.10], 0.35],
      [[0.50, 0.10, 0.05], 0.65]
    ].each do |change, amount|
      assert_equal change, @cc.change(amount)
    end
  end
end

Minitest.autorun

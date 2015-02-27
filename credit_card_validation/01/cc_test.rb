require 'minitest'
require 'minitest/reporters'
require_relative 'cc'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({detailed_skip: false})]

class CCTest < Minitest::Test
  def test_failure
    cc_number = 222222222225
    refute CreditCard.new(cc_number).valid?
  end

  def test_success
    cc_number = 222222222224
    assert CreditCard.new(cc_number).valid?
  end
end

Minitest.autorun

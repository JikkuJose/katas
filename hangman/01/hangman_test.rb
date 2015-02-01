require 'minitest'
require 'minitest/reporters'
require_relative 'hangman'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new({color: true})]

class HMTest < Minitest::Test
  def setup
    @h = Hangman.new 'pine apple'
  end

  def test_accepts_a_word_during_initialization
    h = Hangman.new 'new word'
    assert_equal h.class, Hangman
  end

  def test_take_guess_method
    %w[p i i y].each { |character| @h.take_guess character }
    assert_equal %w[p i y], @h.instance_eval { @guesses }
  end

  def test_current_word
    %w[p i].each { |character| @h.take_guess character }
    assert_equal 'pi__ _pp__', @h.current_word
  end

  def test_done
    h = Hangman.new 'aPple'
    %w[a p l E].each { |character| h.take_guess character }
    assert_equal true, h.done?

    m = Hangman.new 'balloon'
    %w[b a l o].each { |character| m.take_guess character }
    assert_equal false, m.done?

    n = Hangman.new 'waTer bottle'
    %w[w a t e r B o t l].each { |character| n.take_guess character }
    assert_equal true, n.done?

    p = Hangman.new 'pink phone'
    %w[p i n k h o].each { |character| p.take_guess character }
    assert_equal false, p.done?
  end
end

Minitest.autorun

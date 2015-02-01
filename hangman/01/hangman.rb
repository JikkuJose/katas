class Hangman
  attr_reader :word

  def initialize(word)
    @word = word.downcase
    @guesses = []
  end

  def take_guess(c)
    character = c.downcase.strip
    @guesses << character unless @guesses.include? character
  end

  def current_word
    @word.gsub(/[^#{@guesses.join}\s]/, '_')
  end

  def done?
    !(@word.tr(@guesses.join, '*') =~ /\w/)
  end
end

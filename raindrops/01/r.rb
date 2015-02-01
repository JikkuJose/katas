class RainDrops
  SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def make_sound(number)
    result = SOUNDS.each_with_object([]) do |(factor, sound), record|
      record << sound if number % factor == 0
    end
    result.empty? ? number : result.join
  end
end

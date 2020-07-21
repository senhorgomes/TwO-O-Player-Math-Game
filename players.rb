class Player

  attr_reader :name, :lives, :currently_playing
  def initialize(name)
  @name = name
  @lives = 3
  @currently_playing = true
  end

  def incorrect
    @lives -= 1
  end

  def gameover
    @lives == 0
  end
end

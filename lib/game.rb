class Game
  def initialize
    @rolls = []
    @current_roll = 0
  end

  def roll(pins)
    @current_roll += 1
    @rolls << pins
  end

  def score
    total_score = 0

    @rolls.each do |pins|
      total_score += pins
    end

    total_score
  end
end

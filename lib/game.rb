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

    frame_index = 0
    (0...10).each do |frame|
      if spare? frame_index
        total_score += 10 + @rolls[frame_index + 2]
        frame_index += 2
      else
        total_score += @rolls[frame_index] + @rolls[frame_index + 1]
        frame_index += 2
      end
    end

    total_score
  end

  private 

  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end
end

class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0

    roll = 0
    (0...10).each do |frame|
      next_roll = @rolls[roll + 1]
      next_roll = 0 if next_roll.nil?

      if strike? roll
        total_score += calculate_strike roll
        roll += 1
      elsif spare? roll
        total_score += calculate_spare roll
        roll += 2
      else
        total_score += calculate_frame roll
        roll += 2
      end
    end

    total_score
  end

  private 

  def strike?(roll)
    @rolls[roll] == 10
  end

  def spare?(roll)
    @rolls[roll] + @rolls[roll + 1] == 10
  end

  def calculate_frame(roll)
    @rolls[roll] + @rolls[roll + 1]
  end

  def calculate_strike(roll)
    10 + @rolls[roll + 1] + @rolls[roll + 2]
  end

  def calculate_spare(roll)
    10 + @rolls[roll + 2]
  end
end

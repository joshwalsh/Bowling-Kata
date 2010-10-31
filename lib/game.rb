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
   ball_one(roll) + ball_two(roll)
  end

  def calculate_strike(roll)
    ball_one(roll) + extra_ball_one(roll) + extra_ball_two(roll)
  end

  def calculate_spare(roll)
    ball_one(roll) + ball_two(roll) + extra_ball_one(roll)
  end

  def ball_one(roll)
    @rolls[roll]
  end
  
  def ball_two(roll)
    @rolls[roll + 1]
  end

  def extra_ball_one(roll)
    @rolls[roll + 2]
  end

  def extra_ball_two(roll)
    ball_two(roll)
  end
end

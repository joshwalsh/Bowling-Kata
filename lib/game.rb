class Game
  def initialize
    @rolls = []
    @current_roll = 0
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0

    (0...10).each do |frame|
      total_score += calculate_frame
    end

    total_score
  end

  private 

  def strike?
    ball_one(@current_roll) == 10
  end

  def spare?
    ball_one(@current_roll) + ball_two(@current_roll) == 10
  end

  def calculate_frame
    if strike?
      calculate_strike
    elsif spare?
      calculate_spare
    else
      roll = @current_roll
      @current_roll += 2

      ball_one(roll) + ball_two(roll)
    end
  end

  def calculate_strike
    roll = @current_roll
    @current_roll += 1

    ball_one(roll) + extra_ball_one(roll) + extra_ball_two(roll)
  end

  def calculate_spare
    roll = @current_roll
    @current_roll += 2

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

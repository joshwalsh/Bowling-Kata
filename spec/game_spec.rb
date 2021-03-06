require 'game'

describe Game do
  subject { Game.new }

  def roll_many(n, pins)
    n.times { subject.roll pins }
  end

  def roll_spare
    subject.roll 5
    subject.roll 5
  end

  def roll_strike
    subject.roll 10
  end

  it "scores 0 for gutter game" do
    roll_many 20, 0
    subject.score.should == 0
  end
  
  it "scores 20 for all 1's" do
    roll_many 20, 1
    subject.score.should == 20
  end

  it "scores games with 1 spare" do
    roll_spare
    subject.roll 3
    roll_many 17, 0

    subject.score.should == 16
  end

  it "scores game with 1 strike" do
    roll_strike
    subject.roll 3
    subject.roll 4
    roll_many 16, 0

    subject.score.should == 24
  end

  it "scores a perfect game" do
    roll_many 12, 10
    subject.score.should == 300
  end
end

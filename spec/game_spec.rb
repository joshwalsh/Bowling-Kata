require 'game'

describe Game do
  subject { Game.new }

  def roll_many(n, pins)
    n.times { subject.roll pins }
  end

  it "scores 0 for gutter game" do
    roll_many 20, 0
    subject.score.should == 0
  end
  
  it "scores 20 for all 1's" do
    roll_many 20, 1
    subject.score.should == 20
  end
end

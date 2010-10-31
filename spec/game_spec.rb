require 'game'

describe Game do
  subject { Game.new }

  it "scores 0 for gutter game" do
    20.times { subject.roll 0 }
    subject.score.should == 0
  end
  
  it "scores 20 for all 1's" do
    20.times { subject.roll 1 }
    subject.score.should == 20
  end
end

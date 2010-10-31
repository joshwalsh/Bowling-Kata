require 'game'

describe Game do
  subject { Game.new }

  it "scores 0 for gutter game" do
    20.times { subject.roll 0 }
    subject.score.should == 0
  end
end

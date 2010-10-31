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

  #it "scores games with 1 spare" do
    #subject.roll 5
    #subject.roll 5
    #subject.roll 3
    #roll_many 17, 0

    #subject.score.should == 16
  #end
end

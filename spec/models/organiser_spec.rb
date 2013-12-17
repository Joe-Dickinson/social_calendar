require 'spec_helper'

describe Organiser do
  it { should have_many(:events) }
  it { should have_many(:happenings).through(:guests) }
  it { should have_many(:interests).through(:likes)}
  it { should have_many(:recommendations)}

  describe "Recommended events" do
    before do
      @event = Event.make!
      @event_nye = Event.make!(:NYE)
      @event_skydiving = Event.make!(:skydiving)
      @interest = Interest.make!
      @another_interest = Interest.make!(:bad)
      @timmy = Organiser.make!(:timmy)
      @sally = Organiser.make!(:sally)
      @emily = Organiser.make!
      @event.members << @timmy
      @timmy.happenings << @event
      @emily.happenings << @event
      @timmy.happenings << @event_nye
      @timmy.happenings << @event_skydiving
      @timmy.interests << @interest
      @sally.interests << @interest
      @emily.interests << @interest
      @timmy.interests << @another_interest
      @recommendations = @sally.get_recommendations
    end

    it "should recommend Timmy's event to Sally" do
      binding.pry
      @recommendations.should_not eq(nil)
      @recommendations.first.should eq(@event)
    end 

    # it "should find all the interests with at least two people liking it" do
    #   @timmy.popular_interests.should include(@interest)
    #   @timmy.popular_interests.should_not include(@another_interest)
    # end

  end
end

require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "initialize" do
    it "exists" do
      expect(@biker).to be_a(Biker)
    end

    it "has readable attributes" do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
    end

    it "starts with empty rides hash" do
      expect(@biker.rides).to eq({})
    end

    it "starts with empty acceptable_terrain array" do
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn_terrain!" do
    it "can learn a new terrain" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride' do
    it 'can log a ride with a time' do
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)

      expected = {
        @ride1 => [92.5]
      }
      expect(@biker.rides).to eq(expected)
    end

    it 'can log a ride with multipile times' do
      @biker.learn_terrain!(:hills)
      @biker.learn_terrain!(:gravel)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expected = {
        @ride1 => [92.5, 91.1],
        @ride2 => [60.9, 61.6]
      }
      expect(@biker.rides).to eq(expected)
    end

  end
end
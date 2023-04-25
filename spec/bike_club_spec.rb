require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club = BikeClub.new("Dill")

    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @biker3 = Biker.new("Mildred", 30)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @ride3 = Ride.new({name: "Jamestown", distance: 20, loop: true, terrain: :gravel})
  end

  describe 'initialize' do
    it 'exists' do
      expect(@bike_club).to be_a(BikeClub)
    end

    it 'has readable attributes' do
      expect(@bike_club.name).to eq("Dill")
    end

    it 'starts with no memebers' do
      expect(@bike_club.bikers).to eq([])
    end
  end

  describe '#add_biker' do
    it 'can add a biker to the club' do
      @bike_club.add_biker(@biker)
      expect(@bike_club.bikers).to eq([@biker])
    end
  end

  describe '#most_rides' do
    it 'can return the biker with the most rides' do
      @biker.learn_terrain!(:hills)
      @biker.learn_terrain!(:gravel)
      @biker3.learn_terrain!(:hills)
      @biker3.learn_terrain!(:gravel)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      @biker.log_ride(@ride3, 100)

      @bike_club.add_biker(@biker)

      expect(@bike_club.bikers).to eq([@biker])

      @biker3.log_ride(@ride1, 92.5)
      @biker3.log_ride(@ride1, 91.1)
      @biker3.log_ride(@ride2, 60.9)

      @bike_club.add_biker(@biker3)

      expect(@bike_club.bikers).to eq([@biker, @biker3])

      expect(@bike_club.most_rides).to eq(@biker)
    end
  end
end
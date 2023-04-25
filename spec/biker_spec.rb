require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
  end

  describe 'initialize' do
    it 'exists' do
      expect(@biker).to be_a(Biker)
    end

    it 'has readable attributes' do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
    end

    it 'starts with empty rides hash' do
      expect(@biker.rides).to eq({})
    end

    it 'starts with empty acceptable_terrain array' do
      expect(@biker.acceptable_terrain).to eq([])
    end

  end
end
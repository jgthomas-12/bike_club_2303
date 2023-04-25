class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    biker_amt_rides = Hash.new(0)
    @bikers.each do |biker|
      biker.rides.each do |ride, times|
        if times.count > 1
          biker_amt_rides[biker] += times.count
        else
          biker_amt_rides[biker] += 1
        end
      end
    end
    most = biker_amt_rides.max_by do |biker, ride_count|
      ride_count
    end
    most[0]
  end
end
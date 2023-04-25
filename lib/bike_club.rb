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

  def best_time(ride)
    biker_best_time = Hash.new(0)
    @bikers.each do |biker|
      biker.rides.each do |ride1, times|
        if ride == ride1
          if times.count > 1
            best_time = times.min_by do |time|
              time
            end
            biker_best_time[biker] = best_time
          else
            biker_best_time[biker] = times
          end
        end
      end
    end
    best = biker_best_time.min_by do |biker, time|
      time
    end
    best[0]
  end
end
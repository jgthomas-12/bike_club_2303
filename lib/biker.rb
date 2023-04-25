class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && @max_distance > ride.total_distance
      if @rides[ride] == nil
        @rides[ride] = [time]
      else
        @rides[ride] += [time]
      end
    end
  end

  def personal_record(ride)
    pers_rec = Hash.new(0)
    @rides.each do |rides, times|
      if ride == rides
        min_time =times.min_by do |time|
          time
        end
        pers_rec[rides] = min_time
      end
    end
    return pers_rec[ride] unless !pers_rec.keys.include?(ride)
    false
  end
end
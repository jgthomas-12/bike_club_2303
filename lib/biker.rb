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
    if @acceptable_terrain.include?(ride.terrain)
      if @rides[ride] == nil
        @rides[ride] = [time]
      else
        @rides[ride] += [time]
      end
    end
    # rider_log = Hash.new(0)
    # require 'pry'; binding.pry
    # if rider_log.keys.include?(ride.name)
    #   rider_log[ride] = time
    # end

  end
end
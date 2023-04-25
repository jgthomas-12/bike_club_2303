class Ride
  attr_reader :name,
              :distance,
              :loop,
              :terrain

  def initialize(details)
    @name = details[:name]
    @distance = details[:distance]
    @loop = details[:loop]
    @terrain = details[:terrain]
  end

  def loop?
    @loop
  end
end
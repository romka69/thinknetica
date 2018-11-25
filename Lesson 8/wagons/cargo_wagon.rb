class CargoWagon < Wagon
  attr_reader :place, :busy_place

  def initialize(place)
    @place = place
    @busy_place = 0
    super(:cargo)
  end

  def take_places(place)
    @busy_place += place
  end
end

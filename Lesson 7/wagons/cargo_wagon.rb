class CargoWagon < Wagon
  attr_reader :place, :busy_place

  def initialize(type = :cargo, place)
    @place = place
    @busy_place = 0
    super
  end

  def take_places(place)
    @busy_place += place
  end
end

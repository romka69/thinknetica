require_relative 'module/instance_counter.rb'

class Route
  include InstanceCounter
  
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    i = -2
    @stations.insert(i, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def station_list
    @stations.each { |station| puts station.name }
  end
end

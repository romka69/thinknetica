require_relative 'module/instance_counter.rb'

class Route
  include InstanceCounter
  
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    i = -2
    @stations.insert(i, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def station_list
    @stations.each { |station| station.name }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "Для создания маршрута необходимы 2 станции." if @stations.size < 2 
  end
end

require_relative 'module/brand_name.rb'
require_relative 'module/instance_counter.rb'

class Train
  include BrandName
  include InstanceCounter

  NUMBER_FORMAT = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i.freeze

  attr_reader :number, :type, :wagons, :speed, :route

  @@trains = []

  def self.find(number)
    @@trains.find { |train| train.number == number }
  end

  def initialize(number, type)
    @number = number.to_s
    @type = type.to_sym
    @wagons = []
    @route = []
    @speed = 0
    @station_index = 0
    validate!
    @@trains << self
    register_instance
  end

  attr_writer :speed

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    @wagons << wagon if @speed.zero?
  end

  def del_wagon
    @wagons.pop if @speed.zero?
  end

  def add_route(route)
    @route = route
    @route.stations[0].incoming_train(self)
  end

  def move_next_station
    return unless next_station

    current_station.send_train(self)
    next_station.incoming_train(self)
    @station_index += 1
  end

  def move_previous_station
    return unless previous_station

    current_station.send_train(self)
    previous_station.incoming_train(self)
    @station_index -= 1
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1] if @station_index != @route.stations.size - 1
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index != 0
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def each_wagon
    @wagons.each { |wagon| yield(wagon) }
  end

  protected

  def validate!
    raise 'Номер должен быть в формате: ХХХ-ХХ или ХХХХХ.' if number !~ NUMBER_FORMAT
    raise 'Тип должен быть грузовым или пассажирским.' unless %i[cargo passenger].include?(type)
  end
end

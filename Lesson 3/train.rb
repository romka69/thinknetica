class Train
  attr_reader :number, :type, :wagons, :speed

  def initialize(number, type, wagons)
    @number = number.to_s
    @type = type.to_sym
    @wagons = wagons.to_i
    @route = []
    @speed = 0
    @station_index = 0
  end

  def speed=(speed)
    @speed = speed
  end
  
  def stop
    @speed = 0
  end
  
  def count_wagon
    puts @wagon
  end

  def add_wagon
    @wagons += 1 if @speed.zero?
  end

  def del_wagon
    @wagons -= 1 if @speed.zero?
  end

  def route=(route)
    @route = route
    @route.stations[0].incoming_train(self)
  end

  def move_next_station
    if next_station
      current_station.send_train(self)
      next_station.incoming_train(self)
      @station_index += 1
    end
  end

  def move_previous_station
    if previous_station
      current_station.send_train(self)
      next_station.incoming_train(self)
      @station_index -= 1
    end
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
end

class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name.to_s
    @trains = []
  end
  
  def incoming_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_list
    @trains.each { |train| puts train.number }
  end

  def train_list_type(type)
    trains = @trains.select { |train| train.type == type }
    trains.each { |train| puts train.number }
  end
end

require_relative 'module/instance_counter.rb'

class Station
  include InstanceCounter

  attr_reader :trains, :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name.to_s
    @trains = []
    validate!
    @@stations << self
    register_instance
  end
  
  def incoming_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_list
    @trains.each { |train| train.number }
  end

  def train_list_type(type)
    trains = @trains.select { |train| train.type == type }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "Имя не может быть пустым." if name.nil? || name.empty?
  end
end

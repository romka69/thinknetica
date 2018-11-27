require_relative 'module/instance_counter.rb'
require_relative 'module/validation.rb'

class Station
  include InstanceCounter
  include Validation

  validate :name, :presence
  validate :name, :type, String

  attr_reader :trains, :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
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
    @trains.each(&:number)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end
end

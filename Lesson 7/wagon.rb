require_relative 'module/brand_name.rb'

class Wagon
  include BrandName

  attr_reader :type

  def initialize(type, *_args)
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "Тип должен быть грузовым или пассажирским." unless [:cargo, :passenger].include?(type)
  end
end

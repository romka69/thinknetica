require_relative 'module/brand_name.rb'

class Wagon
  include BrandName

  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Тип должен быть грузовым или пассажирским.' unless %i[cargo passenger].include?(type)
  end
end

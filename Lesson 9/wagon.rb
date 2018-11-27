require_relative 'module/brand_name.rb'
require_relative 'module/accessors.rb'

class Wagon
  extend Accessors
  include BrandName

  attr_reader :type
  attr_accessor_with_history :color, :floors
  strong_attr_accessor :serial_number, Integer

  def initialize(type)
    @type = type
    @serial_number = rand(100...999)
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

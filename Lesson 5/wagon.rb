require_relative 'module/brand_name.rb'

class Wagon
  include BrandName

  attr_reader :type

  def initialize(type)
    @type = type
  end
end

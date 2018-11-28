module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @validate_data

    def validate_data
      @validate_data ||= []
    end

    def validate(name, option, param = nil)
      raise "Неправильный тип валидации." unless %i[presence format type].include?(option)

      validate_data << { name: name, option: option, param: param }
    end
  end
  
  module InstanceMethods
    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def validate!
      self.class.validate_data.each do |val|
        name = val[:name]
        name_val = instance_variable_get("@#{name}".to_sym)
        option_val = val[:option].to_sym
        param_val = val[:param]

        if option_val == :presence
          raise "Значение '#{name}' не должно быть 'nil' или пустым!" if name_val.nil? || name_val.to_s.empty?
        elsif option_val == :format
          raise "Значение '#{name}' не соответствует заданному формату '#{param_val}'!" if name_val !~ param_val
        elsif option_val == :type
          raise "Значение типа '#{name}' должно быть '#{param_val}'!" unless name_val.class == param_val
        end
      end
    end
  end
end

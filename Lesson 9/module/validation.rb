module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
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

    def validate!
      self.class.validate_data.each do |val|
        name = val[:name]
        name_val = instance_variable_get("@#{name}".to_sym)

        eval("validate_#{val[:option]}(name_val, val[:param])")
      end
    end

    def validate_presence(name, _param)
      raise "Значение переменной не должно быть 'nil' или пустым!" if name.nil? || name.to_s.empty?
    end

    def validate_format(name, format)
      raise "Значение переменной не соответствует заданному формату '#{format}'!" if name !~ format
    end

    def validate_type(name, type)
      raise "Значение типа переменной должно быть '#{type}'!" unless name.class == type
    end
  end
end

module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      name_sym = "@#{name}".to_sym
      name_history_sym = "@#{name}_hystory".to_sym

      define_method(name) { instance_variable_get(name_sym) }
      define_method("#{name}=") do |val|
        instance_variable_set(name_history_sym, []) if instance_variable_get(name_history_sym).nil?
        instance_variable_get(name_history_sym).send(:push, val)
        instance_variable_set(name_sym, val)
      end

      define_method("#{name}_history") { instance_variable_get(name_history_sym) }
    end
  end

  def strong_attr_accessor(name, type)
    name_sym = "@#{name}".to_sym

    define_method(name) { instance_variable_get(name_sym) }
    define_method("#{name}=") do |val|
      raise TypeError, "Значение типа переменной должно быть '#{type}'!" unless val.class == type

      instance_variable_set(name_sym, val)
    end
  end
end

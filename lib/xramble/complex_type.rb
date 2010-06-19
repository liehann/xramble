module Xramble
  # Include in classes to add xsd mapping functionality.
  #
  # Example:
  #  class MyComplexType
  #    include Xramble::ComplexType
  #    
  #    attribute :name
  #    element :name
  #  end
  module ComplexType
    def self.included(mod)
      mod.extend ClassMethods
    end

    module ClassMethods
      def namespace(url, options = {})
      end

      # Defines an instance variable that is marshalled as an element.
      #  class MyDoc
      #    include Xramble::ComplexType
      #    element :element
      #  end
      # will get marshalled as
      #  <MyDoc>
      #    <element></element>
      #  </MyDoc>
      def element(name, options = {})
        add_accessor_methods(name)
      end

      # Defines an instance variable that is marshalled as an attribute.
      #  class MyDoc
      #    include Xramble::ComplexType
      #    attribute :attribute
      #  end
      # will get marshalled as
      #  <MyDoc attribute=''>
      #  </MyDoc>
      def attribute(name, options = {})
        add_accessor_methods(name)
      end

      private

      def add_accessor_methods(name)
        inst_symbol = "@#{name}".to_sym
        define_method("#{name}=") do |value|
          self.instance_variable_set(inst_symbol, value)
        end

        define_method(name) do
          self.instance_variable_get(inst_symbol)
        end
      end
    end
  end
end


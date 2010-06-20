module Xramble
  # Include in classes to add xsd mapping functionality.
  #
  # Example:
  #  class MyComplexType
  #    include Xramble::ComplexType
  #    
  #    attribute :name
  #    element :node
  #  end
  module ComplexType
    def self.included(mod)
      mod.extend ClassMethods
      mod.send(:include, InstanceMethods)

      # Initialize class variables
      mod.send(:class_variable_set, :@@namespace, nil)
      mod.send(:class_variable_set, :@@elements, [])
      mod.send(:class_variable_set, :@@attributes, [])
    end

    module InstanceMethods

      # Returns and xml string representation of the object.
      #
      # Example:
      #  class MyComplexType
      #    include Xramble::ComplexType
      #    
      #    attribute :name
      #    element :node
      #  end
      #  
      #  obj = MyComplexType.new()
      #  obj.to_xml
      #  >>> <MyComplexType name=''><node/></MyComplexType>
      def to_xml(namespaces = {})
      end

      def attributes
        self.class.attributes
      end

      def elements
        self.class.elements
      end

    end

    module ClassMethods
      # Set or retrive the object xml namespace.
      #
      #  class MyComplexType
      #    include Xramble::ComplexType
      #    namespace 'namespace:uri'
      #  end
      #  
      #  MyComplexType.namespace
      #  >>> 'namespace:uri'
      #
      # A namespace prefix can be supplied.
      #  class MyComplexType
      #    include Xramble::ComplexType
      #    namespace 'namespace:uri', 'ns'
      #  end
      #  
      #  MyComplexType.namespace_prefix
      #  >>> 'ns'
      def namespace(*args)
        if (args.size > 0)
          @@namespace = args[0]
          @@namespace_prefix = args[1]
        else
          @@namespace
        end
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
        elements << name
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
        attributes << name
        add_accessor_methods(name)
      end

      def attributes
        class_variable_get(:@@attributes)
      end

      def elements
        class_variable_get(:@@elements)
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


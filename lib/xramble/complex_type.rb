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

      def element(name, options = {})
      end

      def attribute(name, options = {})
      end
    end
  end
end


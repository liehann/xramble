require 'test_helper'

class TestComplexType < Test::Unit::TestCase
  context "including the ComplexType module" do

    should "add module methods" do
      class CT
        include Xramble::ComplexType
      end

      assert(CT.methods.include?('element'))
      assert(CT.methods.include?('attribute'))
      assert(CT.methods.include?('namespace'))
    end

    should "define accessor methods for attributes" do
      class CT
        include Xramble::ComplexType
        attribute :name
      end

      assert(CT.attributes.include?(:name))

      ct = CT.new()
      assert(ct.methods.include?('name'))
      assert(ct.methods.include?('name='))
      ct.name = 'value'
      assert_equal('value', ct.name)
    end

    should "define accessor methods for elements" do
      class CT
        include Xramble::ComplexType
        element :element
      end

      assert(CT.elements.include?(:element))

      ct = CT.new()
      assert(ct.methods.include?('element'))
      assert(ct.methods.include?('element='))
      ct.element = 'value'
      assert_equal('value', ct.element)
    end

    should "define a to_xml method" do
      class CT
        include Xramble::ComplexType
      end

      ct = CT.new()
      assert(ct.methods.include?('to_xml'))
    end

    should "define a namespace method" do
      class CT
        include Xramble::ComplexType
        namespace 'namespace:uri'
      end

      assert(CT.methods.include?('namespace'))
      assert_equal('namespace:uri', CT.namespace)
    end

  end
end


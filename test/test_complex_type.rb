require 'test_helper'

class TestComplexType < Test::Unit::TestCase
  context "the ComplexType module" do

    should "add module methods" do
      class CT
        include Xramble::ComplexType
      end

      # puts (CT.methods - Object.methods).inspect
      assert(CT.methods.include?('element'))
      assert(CT.methods.include?('attribute'))
      assert(CT.methods.include?('namespace'))
    end

    should "define accessor methods for attributes" do
      class CT
        include Xramble::ComplexType
        attribute :name
      end

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

      ct = CT.new()
      assert(ct.methods.include?('element'))
      assert(ct.methods.include?('element='))
      ct.element = 'value'
      assert_equal('value', ct.element)
    end

  end
end


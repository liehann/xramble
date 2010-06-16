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

  end
end


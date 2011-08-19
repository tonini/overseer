module Overseer

  class Assertion < Exception
  end

  module Assertions
    def assert(test, message=nil)
      Overseer.current_test.assertions += 1
      raise Assertion, message unless test
    rescue Assertion => e
      Overseer.current_test.failures << e
    end

    def assert_equal(expected, actual, message=nil)
      message ||= "Expected: \"#{expected}\"\n          Got: \"#{actual}\""
      assert(expected == actual, message)
    end

    def assert_nil(obj, message=nil)
      message ||= "Expected \"#{obj}\" to be nil"
      assert(obj.nil?, message)
    end
  end
end

module Overseer

  class Assertion < Exception
  end

  module Assertions
    def assert(test, message=nil)
      Overseer.current_test.assertions += 1
      raise Assertion, message
    rescue Assertion => e
      Overseer.current_test.failures << e
    end

    def assert_equal(expected, actual, message=nil)
      message ||= "Expected: #{expected}\n Got: #{actual}"
      assert(expected == actual, message)
    end
  end
end

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

    def assert_kind_of(clazz, obj, message=nil)
      message ||= "Expected \"#{obj.inspect}\" to be a kind of \"#{clazz}\", not \"#{obj.class}\""
      assert(obj.kind_of?(clazz), message)
    end

    def assert_instance_of(clazz, obj, message=nil)
      message ||= "Expected \"#{obj.inspect}\" to be an instance of \"#{clazz}\", not \"#{obj.class}\""
      assert(obj.instance_of?(clazz), message)
    end

    def assert_respond_to(obj, method, message=nil)
      message ||= "Expected \"#{obj.inspect}\" to respond to \"##{method}\""
      assert(obj.respond_to?(method), message)
    end
  end
end

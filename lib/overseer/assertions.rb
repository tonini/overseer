module Overseer

  # Generic Assertion exception class
  #
  class Assertion < Exception
  end

  # A set of assertion methods
  #
  module Assertions

    # Raises an +Assertion+ exception if the given object isn't
    # +true+. It adds the exception to the failure collection of
    # the current test, in which the assertion was executed
    #
    # ==== Parameters
    # result:: the assertion result
    # message<String>:: the identifying message for the +Assertion+ excpetion
    #
    def assert(result, message=nil)
      Overseer.current_test.assertions += 1
      raise Assertion, message unless result
    rescue Assertion => e
      Overseer.current_test.failures << e
    end

    # Compare two given objects if they are equal
    # Fails if +actual+ isn't equal to +expected+
    #
    # === Parameters
    # expected:: the object which is expected
    # actual:: the actual given object
    # message<String>:: the identifying message for the +Assertion+ exception
    #
    def assert_equal(expected, actual, message=nil)
      message ||= "Expected: \"#{expected}\"\n          Got: \"#{actual}\""
      assert(expected == actual, message)
    end

    # Verify if an object is +nil+
    # Fails if +obj+ isn't +nil+
    #
    # === Parameters
    # obj:: the object which will be verified
    # message<String>:: the identifying message for the +Assertion+ exception
    #
    def assert_nil(obj, message=nil)
      message ||= "Expected \"#{obj}\" to be nil"
      assert(obj.nil?, message)
    end

    # Verify if an object is a kind of a specified class
    # Fails if +obj+ isn't a kind of +clazz+
    #
    # === Parameters
    # clazz:: the expected class which should +obj+ be a kind of
    # obj:: the object which will be verified
    # message<String>:: the identifying message for the +Assertion+ exception
    #
    def assert_kind_of(clazz, obj, message=nil)
      message ||= "Expected \"#{obj.inspect}\" to be a kind of \"#{clazz}\", not \"#{obj.class}\""
      assert(obj.kind_of?(clazz), message)
    end

    # Verify if an object is a instance of a specified class
    # Fails if +obj+ isn't an instance of +clazz+
    #
    # === Parameters
    # clazz:: the expected class which should +obj+ be an instance of
    # obj:: the object which will be verified
    # message<String>:: the identifying message for the +Assertion+ exception
    #
    def assert_instance_of(clazz, obj, message=nil)
      message ||= "Expected \"#{obj.inspect}\" to be an instance of \"#{clazz}\", not \"#{obj.class}\""
      assert(obj.instance_of?(clazz), message)
    end

    # Verify if an object responds to a method.
    # Fails if +obj+ doesn't respond to +method+
    #
    # === Parameters
    # obj:: the object which will be verified
    # method:: the name of the method which +obj+ should respond to
    # message<String>:: the identifying message for the +Assertion+ exception
    #
    def assert_respond_to(obj, method, message=nil)
      message ||= "Expected \"#{obj.inspect}\" to respond to \"##{method}\""
      assert(obj.respond_to?(method), message)
    end
  end
end

require_relative 'helper'

class TestWorld
end

class TestSuite
  include Overseer

  before do
    @suite = Suite.new(TestWorld)
  end

  after do
    @suite.tests.clear
  end

  test "#name" do
    assert_equal "TestWorld", @suite.name
  end

  test "#total_test_errors" do
    test = Test.new("the first one!")
    @suite.tests << test

    assert_equal 0, @suite.total_test_errors

    test.errors << "ERROR"
    assert_equal 1, @suite.total_test_errors
  end

  test "#total_test_failures" do
    test = Test.new("doing it!")
    @suite.tests << test

    assert_equal 0, @suite.total_test_failures

    test.failures << "FAILURE"
    assert_equal 1, @suite.total_test_failures
  end

  test "#total_test_assertions" do
    test = Test.new("give it!")
    @suite.tests << test

    assert_equal 0, @suite.total_test_assertions

    test.assertions += 1
    assert_equal 1, @suite.total_test_assertions
  end

  test "#tests" do
    @suite.tests << Test.new("time to rest!")

    assert_equal 1, @suite.tests.size
    assert_kind_of Array, @suite.tests
  end
end

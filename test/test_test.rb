require_relative 'helper'

class TestTest
  include Overseer

  test "#passed?" do
    test = Test.new("if the world is running")

    test.failures << "big fail"
    assert_false test.passed?

    test.failures.clear

    test.errors << "Got an error!"
    assert_false test.passed?
  end

  test "#errors?" do
    test = Test.new("error mate!")

    test.errors << "outch!"
    assert_true test.errors?
  end

  test "#failures?" do
    test = Test.new("failure hurray!")

    test.failures << "gotcha!"
    assert_true test.failures?
  end
end

require_relative '../lib/overseer'

class BasicTest
  include Overseer

  test "#hello" do
    "nothing happens"
  end

  test "raising an error" do
    this_is_going_to_be_an_error
  end

  test "need some more time" do
    (1..200000).map {|nr| nr += nr}
  end

  test "assertion_equal fail" do
    say = "bye"

    assert_equal "hello", say
  end

  test "assertion_equal passed" do
    number = 12

    assert_equal 12, number
  end

  test "assert_nil failed" do
    the_end = "is coming!"

    assert_nil the_end
  end

  test "assert_nil passed" do
    box = nil

    assert_nil box
  end

end

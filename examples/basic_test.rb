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

  test "assertion fail" do
    say = "bye"

    assert_equal "hello", say
  end

  test "assertion passed" do
    number = 12

    assert_equal 12, number
  end
end

require_relative '../lib/overseer'

class BasicTest
  include Overseer

  test "#hello" do
    "nothing happends"
  end

  test "#other test" do
    this_is_going_to_be_an_error
  end

  test "#get some time" do
    (1..200000).map {|nr| nr += nr}
  end

  test "assertion fail" do
    say = "bye"

    assert_equal "hello", say
  end
end

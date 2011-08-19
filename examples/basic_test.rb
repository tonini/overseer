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

  test "assert_kind_of failed" do
    string = 23

    assert_kind_of String, string
  end

  test "assert_kind_of passed" do
    fixnum = 11

    assert_kind_of Fixnum, fixnum
  end

  test "assert_instance_of failed" do
    float = 120e2

    assert_instance_of Fixnum, float
  end

  test "assert_instance_of passed" do
    bignum = 99999999999999999999999

    assert_instance_of Bignum, bignum
  end

  test "assert_respond_to failed" do
    class Responder
      def hello; end
    end

    assert_respond_to Responder.new, :bye
  end

  test "assert_respond_to passed" do
    class Responder
      def hello; end
    end

    assert_respond_to Responder.new, :hello
  end
end

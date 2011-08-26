# Overseer

Overseer is a testing framework in Ruby for educational purposes.

## Requirements

* Ruby 1.9

## Install

    gem install overseer

## Synopsis

    require 'overseer'

    class YourTestSuite
      include Overseer

      test "who is the godfather of soul" do
        godfather = "james brown!"

        assert_equal "james brown!", godfather
      end

      test "who got the jazz" do
        jazz = "Q-Tip"

        assert_equal "Britney Spears", jazz
      end
    end

    $ ruby your_test_suite_test.rb

    Overseer is running...

    .F

    Open issues:

    1) Failure:
       Test: who got the jazz (in YourTestSuite Suite)
       Expected: "Britney Spears"
            Got: "Q-Tip"
       # your_test_suite.rb:15:in `block in <class:YourTestSuite>'

    Finished in 0.000 seconds
    2 tests, 2 assertions, 1 failures, 0 errors

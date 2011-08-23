module Overseer
  class Suite
    attr_accessor :tests
    attr_reader :name

    def initialize(suite)
      @name = suite.name
    end

    # Run all tests and print a report for each run
    # about the success status
    #
    def run
      tests.each do |test|
        test.run
        Reporter.print_single_test_result(test)
      end
    end

    # The total amount of errors
    #
    def total_test_errors
      tests.inject(0) { |total, test | total + test.errors.size }
    end

    # The total amount of failures
    #
    def total_test_failures
      tests.inject(0) { |total, test | total + test.failures.size }
    end

    # The total test running time
    #
    def total_test_time
      tests.inject(0) { |total, test| total + test.time }
    end

    # The total amount of assertions
    #
    def total_test_assertions
      tests.inject(0) { |total, test | total + test.assertions }
    end

    # All tests for the suite
    #
    def tests
      @tests ||= []
    end
  end
end

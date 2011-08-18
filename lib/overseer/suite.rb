module Overseer
  class Suite
    attr_accessor :tests
    attr_reader :name

    def initialize(suite)
      @name = suite.name
    end

    def run
      tests.each do |test|
        test.run
        Reporter.print_single_test_result(test)
      end
    end

    def total_test_errors
      tests.inject(0) { |total, test | total + test.errors.size }
    end

    def total_test_failures
      tests.inject(0) { |total, test | total + test.failures.size }
    end

    def total_test_time
      tests.inject(0) { |total, test| total + test.time }
    end

    def total_test_assertions
      tests.inject(0) { |total, test | total + test.assertions }
    end

    def tests
      @tests ||= []
    end
  end
end

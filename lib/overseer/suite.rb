module Overseer
  class Suite
    attr_accessor :tests
    attr_reader :name

    def initialize(suite)
      @name = suite.to_s
    end

    def run_each_test(&block)
      tests.each do |test|
        test.run
        block.call(test)
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

    def tests
      @tests ||= []
    end
  end
end

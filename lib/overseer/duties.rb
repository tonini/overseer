module Overseer
  module Duties
    attr_reader :current_suite
    attr_accessor :current_test

    def build_test(name, &block)
      @current_suite.tests << Test.new(name, &block)
    end

    def build_suite(suite)
      @current_suite = Suite.new(suite)
      suites << @current_suite
    end

    def build_before(&block)
      @current_suite.before = block
    end

    def build_after(&block)
      @current_suite.after = block
    end

    def suites
      @suites ||= []
    end

    def failures_exists?
      total_failures > 0
    end

    def errors_exists?
      total_errors > 0
    end

    def total_assertions
      suites.inject(0) { |total, suite| total + suite.total_test_assertions }
    end

    def total_failures
      suites.inject(0) { |total, suite| total + suite.total_test_failures }
    end

    def total_errors
      suites.inject(0) { |total, suite| total + suite.total_test_errors }
    end

    def total_tests
      suites.inject(0) { |total, suite| total + suite.tests.size }
    end

    def total_time
      suites.inject(0) { |total, suite| total + suite.total_test_time }
    end
  end
end

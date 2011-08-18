module Overseer
  class Test
    attr_reader :time, :name, :code, :suite
    attr_accessor :errors, :failures, :assertions

    def initialize(name, &block)
      @name = name
      @code = block
      @suite = Overseer.current_suite
      @errors = []
      @failures = []
      @assertions = 0
    end

    def passed?
      !errors? && !failures?
    end

    def errors?
      errors.any?
    end

    def failures?
      failures.any?
    end

    def run
      Overseer.current_test = self
      start_time = Time.now
      @code.call
    rescue Exception => e
      errors << e
    ensure
      @time = Time.now - start_time
    end
  end
end

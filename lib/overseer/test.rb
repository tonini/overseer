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
      !errors.any? && !failures.any?
    end

    def errors?
      !errors.empty?
    end

    def failures?
      !failures.empty?
    end

    def run
      start_time = Time.now
      @code.call
    rescue Exception => e
      errors << e
    ensure
      @time = Time.now - start_time
    end
  end
end

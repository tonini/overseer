module Overseer
  class Test
    attr_reader :time, :name, :suite, :code

    def initialize(name, &block)
      @name = name
      @code = block
      @suite = Overseer.current_suite
    end

    def passed?
      errors.empty?
    end

    def errors?
      !errors.empty?
    end

    def run
      start_time = Time.now
      @code.call
    rescue Exception => e
      errors << e
    ensure
      @time = Time.now - start_time
    end

    def errors
      @errors ||= []
    end

    def failures
      @failures ||= []
    end

    def assertions=(amount)
      @assertions = amount
    end

    def assertions
      @assertions ||= 0
    end
  end
end

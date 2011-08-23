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

    # Returns +true+ or +false+ depending if the test
    # is passed or not
    #
    def passed?
      !errors? && !failures?
    end

    # Returns +true+ or +false depending if the test
    # have outstanding errors or not
    #
    def errors?
      errors.any?
    end

    # Returns +true+ or +false depending if the test
    # have outstanding failures or not
    def failures?
      failures.any?
    end

    # Run the test, record the run time and store
    # possible exceptions
    #
    def run
      Overseer.current_test = self
      start_time = Time.now
      suite.before.call if suite.before
      begin
        @code.call
      rescue Exception => e
        errors << e
      ensure
        begin
          suite.after.call if suite.after
        rescue Exception => e
          errors << e if passed?
        end
        @time = Time.now - start_time
      end
    end
  end
end

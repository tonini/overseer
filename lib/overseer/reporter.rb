module Overseer
  module Reporter
    def self.report
      print_header
      yield
      print_test_report
    end

    def self.print_header
      puts "Overseer is running..."
      puts
    end

    def self.print_test_report
      puts
      puts
      puts "Finished in %.3f seconds" % Overseer.total_time
      puts "#{Overseer.total_tests} tests, #{Overseer.total_failures} failures, #{Overseer.total_errors} errors"
    end

    def self.print_single_test_result(test)
      print test.passed? ? "." : (test.errors? ? "E" : "F")
    end
  end
end

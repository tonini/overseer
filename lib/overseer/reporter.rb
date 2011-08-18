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
      print_open_issues
      puts
      puts "Finished in %.3f seconds" % Overseer.total_time
      puts Color.green("#{Overseer.total_tests} tests, #{Overseer.total_assertions} assertions, #{Overseer.total_failures} failures, #{Overseer.total_errors} errors")
    end

    def self.print_single_test_result(test)
      print(test.passed? ? Color.green(".") : (test.errors? ? Color.red("E") : Color.red("F")))
    end

    def self.filter_backtrace(backtrace)
      backtrace.reject do |line|
        line.rindex(OVERSEER_DIR, 0)
      end
    end

    def self.format_backtrace_output(backtrace)
      backtrace.map { |line| "     # #{line}"}.join("\n")
    end

    def self.print_open_issues
      if Overseer.failures_exists? || Overseer.errors_exists?
        print "\nOpen issues:\n"
        counter = 1
        Overseer.suites.each do |suite|
          suite.tests.each do |test|
            unless test.passed?
              print_test_issues(test, counter)
              counter += 1
            end
          end
        end
      end
    end

    def self.print_test_issues(test, counter)
      puts
      puts "  #{counter}) #{(test.errors?) ? Color.red("Error:") : Color.red("Failure:")}"
      puts "     Test: #{test.name} (in #{test.suite.name} Suite)"
      exception = if test.errors?
                    test.errors.first
                  else
                    test.failures.first
                  end
      puts Color.red("     #{exception.message}")
      puts Color.bright_black("#{format_backtrace_output(filter_backtrace(exception.backtrace))}")
    end
  end
end

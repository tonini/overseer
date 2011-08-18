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
      print_open_issues
      puts
      puts "Finished in %.3f seconds" % Overseer.total_time
      puts "#{Overseer.total_tests} tests, #{Overseer.total_assertions} assertions, #{Overseer.total_failures} failures, #{Overseer.total_errors} errors"
    end

    def self.print_single_test_result(test)
      print(test.passed? ? "." : (test.errors? ? "E" : "F"))
    end

    # TODO: split it up in more methods
    # TODO: add backtrace filter
    def self.print_open_issues
      if Overseer.total_failures > 0 || Overseer.total_errors > 0
        print "\n\nOpen issues:\n\n"
        counter = 1
        Overseer.suites.each do |suite|
          suite.tests.each do |test|
            unless test.passed?
              puts "  #{counter}) #{(test.errors?) ? "Error:" : "Failure:"}"
              puts "     Test: #{test.name} (in #{test.suite.name} Suite)"
              exception = if test.errors?
                            test.errors.first
                          else
                            test.failures.first
                          end
              puts "     #{exception.message}"
              puts "#{exception.backtrace.join("\n     # ")}"
              counter += 1
            end
          end
        end
      end
    end
  end
end

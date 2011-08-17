module Overseer
  module Runner
    def self.start
      Reporter.report do
        run_suites
      end
    end

    def self.run_suites
      Overseer.suites.each do |suite|
        suite.run_each_test do |test|
          Reporter.print_single_test_result(test)
        end
      end
    end
  end
end

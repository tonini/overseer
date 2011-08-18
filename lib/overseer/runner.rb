module Overseer
  module Runner
    def self.run
      Reporter.report do
        Overseer.suites.each(&:run)
      end
    end
  end
end

require "overseer/reporter"
require "overseer/duties"
require "overseer/dsl"
require "overseer/suite"
require "overseer/test"
require "overseer/runner"
require "overseer/version"

module Overseer
  extend self
  extend Duties

  def included(suite)
    suite.send(:extend, Dsl)
    build_suite(suite)
  end

  at_exit { Runner.start }
end

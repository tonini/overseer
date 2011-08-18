require "overseer/reporter"
require "overseer/color"
require "overseer/duties"
require "overseer/dsl"
require "overseer/assertions"
require "overseer/suite"
require "overseer/test"
require "overseer/runner"
require "overseer/version"

module Overseer
  extend self
  extend Duties

  OVERSEER_DIR = File.dirname(File.dirname(File.expand_path(__FILE__)))

  def included(suite)
    suite.send(:extend, Dsl)
    suite.send(:extend, Assertions)
    build_suite(suite)
  end

  at_exit { Runner.run }
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "overseer/version"

Gem::Specification.new do |s|
  s.name        = "overseer"
  s.version     = Overseer::VERSION
  s.authors     = ["Samuel Tonini"]
  s.email       = ["tonini.samuel@gmail.com"]
  s.homepage    = ""
  s.description = %q{A testing framework in Ruby for educational purpose}
  s.summary     = s.description

  s.rubyforge_project = "overseer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

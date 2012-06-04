# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-dependencies/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fred Leitz"]
  gem.email         = ["fred.leitz@gmail.com"]
  gem.description   = %q{Rudimentary dependency support for Ruby Motion}
  gem.summary       = %q{Track dependencies for ruby motion with comments}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-dependencies"
  gem.require_paths = ["lib"]
  gem.version       = Motion::Dependencies::VERSION
end

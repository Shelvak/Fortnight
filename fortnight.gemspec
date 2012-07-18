# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fortnight/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Néstor Coppi"]
  gem.email         = ["nestorcoppi@gmail.com"]
  gem.description   = %q{Scope to difference by first and second half month}
  gem.summary       = %q{Scope to difference by first and second half month}
  gem.homepage      = "https://github.com/Shelvak/Fortnight"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fortnight"
  gem.require_paths = ["lib"]
  gem.version       = Fortnight::VERSION

  gem.add_dependency 'rails', '>= 3.1.0'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-sapo-connect/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tomé Duarte"]
  gem.email         = ["tduarte@dwk-web.com"]
  gem.summary       = 'SAPO Connect strategy for OmniAuth'
  gem.homepage      = 'https://github.com/tomeduarte/omniauth-sapo-connect'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-sapo-connect"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::SapoConnect::VERSION

  gem.add_runtime_dependency 'omniauth-oauth', '~> 1.0.0'
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'vacuum/version'

Gem::Specification.new do |gem|
  gem.name        = 'vacuum'
  gem.version     = Vacuum::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ['Hakan Ensari']
  gem.email       = ['hakan.ensari@papercavalier.com']
  gem.homepage    = 'https://github.com/hakanensari/vacuum'
  gem.description = 'A wrapper to the Amazon Product Advertising API'
  gem.summary     = 'Amazon Product Advertising in Ruby'

  gem.files         = Dir.glob('lib/**/*') + %w(LICENSE README.md)
  gem.test_files    = Dir.glob('test/**/*')
  gem.require_paths = ['lib']

  gem.add_dependency 'jeff', '~> 0.4.0'
  gem.add_development_dependency 'rake'
  gem.required_ruby_version = '>= 1.9'
end

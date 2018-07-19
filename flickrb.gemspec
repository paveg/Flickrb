# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickrb/version'

Gem::Specification.new do |spec|
  spec.name        = 'flickrb'
  spec.version     = Flickrb::VERSION
  spec.authors     = ['Ryota Ikezawa']
  spec.email       = ['pavegy@gmail.com']
  spec.summary     = 'API Client for flicker.'
  spec.description = 'API Client for flicker.'
  spec.license     = 'MIT'

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'codeclimate-test-reporter'
  spec.add_dependency 'codecov'
  spec.add_dependency 'danger'
  spec.add_dependency 'danger-lgtm'
  spec.add_dependency 'faraday', '~> 0.15'
  spec.add_dependency 'faraday_middleware', '~> 0.12'
  spec.add_dependency 'rspec_junit_formatter'
  spec.add_dependency 'simplecov'

  spec.add_development_dependency 'bundler', '~> 1.16.2'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.58'
  spec.add_development_dependency 'yard'
end

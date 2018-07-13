# frozen_string_literal: true

source 'https://rubygems.org'

group :development do
  gem 'pry'
  gem 'yard'
  gem 'rspec'
end

group :test, :ci do
  gem 'codeclimate-test-reporter', require: false
  gem 'danger', require: false
  gem 'danger-lgtm', require: false
  gem 'rspec'
  gem 'rspec_junit_formatter', require: false
  gem 'simplecov', require: false
end

# Specify your gem's dependencies in flickrb.gemspec
gemspec

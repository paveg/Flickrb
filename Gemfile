# frozen_string_literal: true

source 'https://rubygems.org'

group :development do
  gem 'pry'
  gem 'yard'
end

group :ci do
  gem 'danger', require: false
  gem 'danger-lgtm', require: false
  gem 'rspec_junit_formatter', require: false
  gem 'codeclimate-test-reporter', require: false
end

group :ci, :development, :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'codecov'
end
# Specify your gem's dependencies in flickrb.gemspec
gemspec

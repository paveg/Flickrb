# frozen_string_literal: true

require 'simplecov'

if ENV.fetch('CIRCLE_ARTIFACTS', nil)
  SimpleCov.coverage_dir(File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage'))
else
  SimpleCov.coverage_dir('public/coverage')
end

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
end

if ENV.fetch('CI', 'false') == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'bundler/setup'
require 'flickrb'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expose_dsl_globally = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

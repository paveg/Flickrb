# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'bundler/setup'
require 'flickrb'
require 'simplecov'
require 'pry'

if ENV['CIRCLE_ARTIFACTS']
  SimpleCov.coverage_dir(File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage'))
else
  SimpleCov.coverage_dir('public/coverage')
end

SimpleCov.start do
  %w[/vendor/].each { |path| add_filter(path) }
end

def fixture_path
  File.expand_path('fixtures', __dir__)
end

def fixture(file)
  File.new(fixture_path + '/' + file).read
end

def a_get(path)
  a_request(:get, Flickrb::Configuration::ENDPOINT + path)
end

def a_post(path)
  a_request(:post, Flickrb::Configuration::ENDPOINT + path)
end

def a_put(path)
  a_request(:put, Flickrb::Configuration::ENDPOINT + path)
end

def a_delete(path)
  a_request(:delete, Flickrb::Configuration::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Flickrb::Configuration::ENDPOINT + path)
end

def stub_post(path)
  stub_request(:post, Flickrb::Configuration::ENDPOINT + path)
end

def stub_put(path)
  stub_request(:put, Flickrb::Configuration::ENDPOINT + path)
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expose_dsl_globally = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

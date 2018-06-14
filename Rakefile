# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Install api-mock using json-server'
task :install_api_mock do
  puts '[START] Install api-mock server'
  # check node.js and yarn.
  sh 'node -v'
  sh 'yarn -v'

  # Install json-server
  sh 'yarn install'

  puts '[Success] Installed api-mock server'
end

task :start_api_mock do
  sh 'node api-mock/server.js'
end

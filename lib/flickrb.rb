# frozen_string_literal: true

require 'flickrb/version'
require 'flickrb/client'
require 'flickrb/configuration'
require 'pry'

module Flickrb
  class << self
    include Flickrb::Configuration

    def client
      binding.pry
      unless defined?(@client) && @client.hash == options.hash
        @client = Flickrb::Client.new(options)
      end
      @client
    end

    def respond_to_missing?(method, include_private = false)
      client.respond_to?(method, include_private)
    end

    private

    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end
  end
end

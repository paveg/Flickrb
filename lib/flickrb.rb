# frozen_string_literal: true

require 'flickrb/version'
require 'flickrb/client'
require 'flickrb/configuration'
require 'active_support/core_ext/hash'

module Flickrb
  END_POINT = 'https://www.flickr.com/services'
  REST_PATH = "#{END_POINT}rest/"
  REQUEST_TOKEN_PATH = "#{END_POINT}/oauth/request_token"
  OAUTH_AUTHORIZE_PATH = "#{END_POINT}/oauth/authorize"
  OAUTH_ACCESS_TOKEN_PATH = "#{END_POINT}/oauth/access_token"

  class << self
    include Flickrb::Configuration

    def client
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

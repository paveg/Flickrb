# frozen_string_literal: true

require 'flickrb/version'

module Flickrb
  class Default
    API_VERSION = 1 unless defined?(Flickrb::Default::API_VERSION)
    class << self
      # @return [Hash]
      def options
        Hash[Flickrb::Configuration.keys.map { |key| [key, send(key)] }]
      end

      # @return [String]
      def client_key
        ENV['FLICKR_CLIENT_KEY']
      end

      # @return [String]
      def client_secret
        ENV['FLICKR_CLIENT_SECRET']
      end

      # @return [String]
      def api_version
        API_VERSION
      end

      # @see https://www.flickr.com/services/api/request.rest.html
      # @return [String]
      def endpoint
        'https://api.flickr.com/services'
      end
    end
  end
end
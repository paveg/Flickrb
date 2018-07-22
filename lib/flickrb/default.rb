# frozen_string_literal: true

require 'flickrb/version'

module Flickrb
  class Default
    API_VERSION = 1 unless defined?(Flickrb::Default::API_VERSION)
    class << self
      # @return [Hash]
      def options
        Hash[Flickrb::Configuration.attr_keys.map { |key| [key, send(key)] }]
      end

      # @return [String]
      def api_key
        ENV.fetch('FLICKR_CLIENT_KEY', nil)
      end

      # @return [String]
      def api_secret
        ENV.fetch('FLICKR_CLIENT_SECRET', nil)
      end

      # @return [String]
      def api_version
        API_VERSION
      end
    end
  end
end

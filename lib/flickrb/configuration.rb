# frozen_string_literal: true

require 'flickrb/configuration'
require 'flickrb/default'

module Flickrb
  module Configuration
    extend Forwardable

    attr_accessor :client_key

    unless defined?(Flickrb::Configuration::ENDPOINT)
      ENDPOINT = (ENV['FLICKR_ENDPOINT'] || Flickrb::Default.endpoint).freeze
    end

    class << self
      # @return [Array]
      def keys
        @keys ||= %i[client_key client_secret]
      end
    end

    def configure
      yield self
      self
    end

    def reset!
      Flickrb::Configuration.each_key do |key|
        instance_variable_set(:"@#{key}", Flickrb::Default.options[key])
      end
      self
    end

    private

    # @return [Hash]
    def options
      Hash[
        Flickrb::Configuration.keys.map do |key|
          [key, instance_variable_get(:"@#{key}")]
        end
      ]
    end
  end
end

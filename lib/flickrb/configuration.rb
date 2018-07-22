# frozen_string_literal: true

require 'flickrb/configuration'
require 'flickrb/default'

module Flickrb
  module Configuration
    extend Forwardable

    attr_accessor :api_key

    class << self
      # @return [Array]
      def attr_keys
        @attr_keys ||= %i[api_key api_secret]
      end
    end

    def configure
      yield self
      self
    end

    def reset!
      Flickrb::Configuration.attr_keys.each do |key|
        instance_variable_set(:"@#{key}", Flickrb::Default.options[key])
      end
      self
    end

    private

    # @return [Hash]
    def options
      Hash[
        Flickrb::Configuration.attr_keys.map do |key|
          [key, instance_variable_get(:"@#{key}")]
        end
      ]
    end
  end
end

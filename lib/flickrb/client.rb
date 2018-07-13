# frozen_string_literal: true

require 'flickrb/configuration'
require 'flickrb/request'

module Flickrb
  class Client
    include Flickrb::Configuration
    include Flickrb::Request
    attr_accessor :access_token

    def initialize(options = {})
      @access_token  = options[:access_token]
      @refresh_token = options[:refresh_token]

      Flickrb::Configuration.attr_keys.each do |key|
        instance_variable_set(
          :"@#{key}", options[key] || Flickrb.instance_variable_get(:"@#{key}")
        )
      end
    end
  end
end

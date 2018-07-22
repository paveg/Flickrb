# frozen_string_literal: true

require 'flickrb/configuration'
require 'flickrb/request'
require 'openssl'

module Flickrb
  class Client
    include Flickrb::Configuration
    include Flickrb::Request
    attr_reader :proxy
    attr_reader :access_token

    OAUTH_VERSION = '1.0'

    def initialize(options = {})
      @api_key = ENV.fetch('FLICKR_CLIENT_KEY', options[:api_key])
      @api_secret = ENV.fetch('FLICKR_CLIENT_SECRET', options[:api_secret])
      @callback_url = callback_url(options)
      @access_token = options[:access_token]
      @refresh_token = options[:refresh_token]

      self.proxy = nil
    end

    def proxy=(url)
      @proxy = URI.parse(url || '')
    end

    def request_token
      res = get(REQUEST_TOKEN_PATH, oauth_parameter)
      response_body_hash = hash!(res.body)
      @oauth_token = response_body_hash[:oauth_token]

      res
    end

    def authorize
      get(OAUTH_AUTHORIZE_PATH, oauth_token: @oauth_token)
    end

    private

    def oauth_parameter
      {
        oauth_nonce: nonce,
        oauth_timestamp: timestamp,
        oauth_consumer_key: @api_key,
        oauth_version: OAUTH_VERSION,
        oauth_callback: @callback_url
      }
    end

    def callback_url(options)
      ENV.fetch('FLICKR_CLIENT_CALLBACK_URL', options[:callback_url]) || 'oob'
    end

    def nonce
      [OpenSSL::Random.random_bytes(32)].pack('m0').gsub(/\n$/, '')
    end

    def timestamp
      Time.current.to_i
    end

    def hash!(res)
      res.split('&').map { |s| s.split('=') }.to_h.symbolize_keys
    end
  end
end

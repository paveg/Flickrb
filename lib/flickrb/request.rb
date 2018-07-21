# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'flickrb/configuration'
require 'flickrb/ext/faraday'
require 'oauthenticator'

module Flickrb
  module Request
    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end

    def put(path, params = {})
      request(:put, path, params)
    end

    def delete(path, params = {})
      request(:delete, path, params)
    end

    private

    def connection
      return @connection if instance_variable_defined?(:@connection)

      @scheme = URI.parse(Flickrb::END_POINT).scheme
      @connection = Faraday.new(Flickrb::END_POINT) do |conn|
        conn.request :oauth2, @access_token if @access_token
        conn.request :url_encoded
        conn.request :json
        conn.request :oauthenticator_signer, signature_params
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    def request(method, path, params = {})
      connection.send(method.to_sym, path, params).env
    rescue Faraday::Error::ClientError
      raise 'client error' # TODO: raise error
    end

    def signature_params
      {
        signature_method: https? ? 'PLAINTEXT' : 'HMAC-SHA1',
        consumer_key: @api_key,
        consumer_secret: @api_secret,
        token: @access_token,
        token_secret: @access_token_secret
      }
    end

    def https?
      @scheme == 'https'
    end
  end
end

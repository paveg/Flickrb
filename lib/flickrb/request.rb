# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'flickrb/configuration'
require 'flickrb/ext/faraday'

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

      @connection = Faraday.new(Flickrb::Configuration::ENDPOINT) do |conn|
        conn.request :flickrb_oauth2, @access_token if @access_token
        conn.request :url_encoded
        conn.request :json
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end

    def request(method, path, params = {})
      connection.send(method.to_sym, path, params).env
    rescue Faraday::Error::ClientError
      # TODO: raise error
    end
  end
end

# frozen_string_literal: true

require 'faraday'

module Faraday
  class Request
    class FlickrbOauth2 < Middleware
      def initialize(app, access_token)
        @app = app
        @access_token = access_token
      end

      def call(env)
        env[:request_headers]['Authorization'] ||= "Bearer #{@access_token}"
        @app.call(env)
      end

      register_middleware flickrb_oauth2: FlickrbOauth2
    end
  end
end

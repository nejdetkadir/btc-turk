# frozen_string_literal: true

module BtcTurk
  module Decorators
    module Client
      class RestClient
        BASE_URL = 'https://api.btcturk.com/api/v2'

        attr_reader :api_key, :adapter, :stubs

        def initialize(api_key:, adapter:, stubs:)
          @api_key = api_key
          @adapter = adapter
          @stubs = stubs
        end

        def connection
          @connection ||= Faraday.new(BASE_URL) do |conn|
            conn.request :json
            conn.response :json, content_type: 'application/json'
            conn.adapter adapter, stubs
            conn.headers[BtcTurk::Client::HEADERS[:pck]] = api_key
            conn.headers[BtcTurk::Client::HEADERS[:stamp]] = Time.now.to_i.to_s
            conn.headers[BtcTurk::Client::HEADERS[:signature]] =
              Digest::SHA256.hexdigest(api_key.to_s + conn.headers[BtcTurk::Client::HEADERS[:stamp]].to_s)

            unless BtcTurk.logger.nil?
              conn.response :logger, BtcTurk.logger, body: true, bodies: { request: true, response: true }
            end
          end
        end
      end
    end
  end
end

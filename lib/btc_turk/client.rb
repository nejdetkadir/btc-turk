# frozen_string_literal: true

module BtcTurk
  class Client
    BASE_URL = 'https://api.btcturk.com'
    HEADERS = { pck: 'X-PCK', stamp: 'X-STAMP', signature: 'X-SIGNATURE' }.freeze

    attr_reader :api_key, :adapter

    def initialize(api_key: nil, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
      @stubs = stubs # Test stubs for requests
    end

    # rubocop:disable Metrics/AbcSize
    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter, @stubs
        conn.headers[HEADERS[:pck]] = api_key
        conn.headers[HEADERS[:stamp]] = Time.now.to_i.to_s
        conn.headers[HEADERS[:signature]] = Digest::SHA256.hexdigest(api_key + conn.headers[HEADERS[:stamp]])

        if BtcTurk.logger.present?
          conn.response :logger, BtcTurk.logger, body: true, bodies: { request: true, response: true }
        end
      end
    end
    # rubocop:enable Metrics/AbcSize
  end
end

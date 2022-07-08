# frozen_string_literal: true

module BtcTurk
  class Client
    HEADERS = { pck: 'X-PCK', stamp: 'X-STAMP', signature: 'X-SIGNATURE' }.freeze

    attr_reader :api_key, :adapter, :stubs

    def initialize(api_key: nil, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
      @stubs = stubs # Test stubs for requests
    end

    def public
      BtcTurk::Resources::Public.new(self)
    end

    def connection(client_type)
      BtcTurk::Decorators::Client::Decorator.new(client_type,
                                                 api_key: api_key,
                                                 adapter: adapter,
                                                 stubs: stubs).connection
    end
  end
end

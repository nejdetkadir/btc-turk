# frozen_string_literal: true

module BtcTurk
  module Decorators
    module Client
      class Decorator
        attr_reader :client_type, :api_key, :adapter, :stubs

        def initialize(client_type, api_key:, adapter:, stubs:)
          @client_type = client_type
          @api_key = api_key
          @adapter = adapter
          @stubs = stubs
        end

        def connection
          case client_type
          when :graphql
            BtcTurk::Decorators::Client::GraphqlClient.new(api_key: api_key, adapter: adapter, stubs: stubs).connection
          when :rest
            BtcTurk::Decorators::Client::RestClient.new(api_key: api_key, adapter: adapter, stubs: stubs).connection
          else
            raise ArgumentError, "Unknown client type: #{client}"
          end
        end

        class << self
          def base_url(client_type)
            case client_type
            when :graphql
              BtcTurk::Decorators::Client::GraphqlClient::BASE_URL
            when :rest
              BtcTurk::Decorators::Client::RestClient::BASE_URL
            else
              raise ArgumentError, "Unknown client type: #{client}"
            end
          end
        end
      end
    end
  end
end

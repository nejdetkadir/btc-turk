# frozen_string_literal: true

require 'dry/monads'

module BtcTurk
  module Resources
    class Base
      include Dry::Monads[:result]

      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def get_request(url, params: {}, headers: {})
        client.connection.get(url, params, headers)
      end

      def post_request(url, body:, headers: {})
        client.connection.post(url, body, headers)
      end

      def patch_request(url, body:, headers: {})
        client.connection.patch(url, body, headers)
      end

      def put_request(url, body:, headers: {})
        client.connection.put(url, body, headers)
      end

      def delete_request(url, params: {}, headers: {})
        client.connection.delete(url, params, headers)
      end

      def error_response(response)
        error = BtcTurk.raw_response ? response.body : BtcTurk::Objects::Error.new(response.body)

        Failure(error)
      end
    end
  end
end

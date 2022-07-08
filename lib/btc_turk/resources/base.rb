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

      def get_request(url, client_type:, params: {}, headers: {})
        client.connection(client_type).get(url, params, headers)
      end

      def post_request(url, client_type:, body:, headers: {})
        client.connection(client_type).post(url, body, headers)
      end

      def patch_request(url, client_type:, body:, headers: {})
        client.connection(client_type).patch(url, body, headers)
      end

      def put_request(url, client_type:, body:, headers: {})
        client.connection(client_type).put(url, body, headers)
      end

      def delete_request(url, client_type:, params: {}, headers: {})
        client.connection(client_type).delete(url, params, headers)
      end

      def error_response(response)
        error = if BtcTurk.raw_response
                  response.body
                else
                  BtcTurk::Objects::Error.new(status: response.status,
                                              message: response.body['message'],
                                              code: response.body['code'])
                end

        Failure(error)
      end
    end
  end
end

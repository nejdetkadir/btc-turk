# frozen_string_literal: true

module BtcTurk
  module Resources
    class Public < Base
      def exchange_info
        response = get_request('server/exchangeinfo', client_type: :rest)

        if Helpers.expected_response?(response, 200)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Objects::ExchangeInfo.new(response.body['data'])
                 end

          Success(data)
        else
          error_response(response)
        end
      end

      def ticker_pairs(pair_symbol: nil)
        response = get_request('ticker', params: { pairSymbol: pair_symbol }, client_type: :rest)

        if Helpers.expected_response?(response, 200)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Helpers.create_collection(data: response.body['data'], type: Objects::Ticker)
                 end

          Success(data)
        else
          error_response(response)
        end
      end

      def ticker_currencies(symbol: nil)
        response = get_request('ticker/currency', params: { symbol: symbol }, client_type: :rest)

        if Helpers.expected_response?(response, 200)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Helpers.create_collection(data: response.body['data'], type: Objects::Ticker)
                 end

          Success(data)
        else
          error_response(response)
        end
      end

      def orderbook(pair_symbol:, limit: BtcTurk.default_limit)
        response = get_request('orderbook', params: { pairSymbol: pair_symbol, limit: limit }, client_type: :rest)

        if Helpers.expected_response?(response, 200)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Objects::Orderbook.new(response.body['data'])
                 end

          Success(data)
        else
          error_response(response)
        end
      end

      def trades(pair_symbol:, limit: BtcTurk.default_limit)
        response = get_request('trades', params: { pairSymbol: pair_symbol, limit: limit }, client_type: :rest)

        if Helpers.expected_response?(response, 200)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Helpers.create_collection(data: response.body['data'], type: Objects::Trade)
                 end

          Success(data)
        else
          error_response(response)
        end
      end

      def ohlcs(pair:, from:, to:)
        response = get_request('ohlcs', params: { pair: pair, from: from, to: to }, client_type: :graphql)

        if Helpers.expected_response?(response, 200, skip_success_check: true)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Helpers.create_collection(data: response.body, type: Objects::Ohlc)
                 end

          Success(data)
        else
          error_response(response)
        end
      end

      def klines_history(symbol:, resolution:, from:, to:)
        response = get_request('klines',
                               params: { symbol: symbol, resolution: resolution, from: from, to: to },
                               client_type: :graphql)

        if Helpers.expected_response?(response, 200, skip_success_check: true)
          data = if BtcTurk.raw_response
                   response.body
                 else
                   Objects::Kline.new(response.body)
                 end

          Success(data)
        else
          error_response(response)
        end
      end
    end
  end
end

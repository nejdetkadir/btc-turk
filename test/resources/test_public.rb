# frozen_string_literal: true

require 'test_helper'

class TestPublic < Minitest::Test
  def test_exchange_info
    BtcTurk.reset_config

    stub = stub_request(path: 'server/exchangeinfo',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/exchange_info', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.exchange_info

    data = operation.success

    assert operation.success?
    assert_equal data.currencies.count, 60
    assert_equal data.currencies.first.class.name, 'BtcTurk::Objects::ExchangeInfo::Currency'
    assert_equal data.symbols.count, 140
    assert_equal data.symbols.first.class.name, 'BtcTurk::Objects::ExchangeInfo::Symbol'
    assert_equal data.currencyOperationBlocks.count, 64
    assert_equal data.currencyOperationBlocks.first.class.name, 'BtcTurk::Objects::ExchangeInfo::CurrencyOperationBlock'
    assert_equal data.class.name, 'BtcTurk::Objects::ExchangeInfo'
  end

  def test_exchange_info_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'server/exchangeinfo',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.exchange_info

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_exchange_info_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'server/exchangeinfo',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/exchange_info', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.exchange_info

    data = operation.success

    assert operation.success?
    assert_equal data.dig('data', 'currencies').count, 60
    assert_equal data.dig('data', 'symbols').count, 140
    assert_equal data.dig('data', 'currencyOperationBlocks').count, 64
  end

  def test_exchange_info_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'server/exchangeinfo',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.exchange_info

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end

  def test_ticker_pairs
    BtcTurk.reset_config

    stub = stub_request(path: 'ticker',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/ticker_pairs', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_pairs

    data = operation.success

    assert operation.success?
    assert_equal data.count, 1
    assert_equal data.first.class.name, 'BtcTurk::Objects::Ticker'
    assert_equal data.first.pair, 'BTCUSDT'
    assert_equal data.first.pairNormalized, 'BTC_USDT'
    assert_equal data.first.timestamp, 1_657_049_826_202
    assert_equal data.first.last, 20_300
    assert_equal data.first.denominatorSymbol, 'USDT'
    assert_equal data.first.numeratorSymbol, 'BTC'
    assert_equal data.first.order, 2_000
  end

  def test_ticker_pairs_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'ticker',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_pairs

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_ticker_pairs_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'ticker',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/ticker_pairs', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_pairs

    data = operation.success

    assert operation.success?
    assert_equal data['data'].count, 1
    assert_equal data['data'].first['pair'], 'BTCUSDT'
    assert_equal data['data'].first['pairNormalized'], 'BTC_USDT'
    assert_equal data['data'].first['timestamp'], 1_657_049_826_202
    assert_equal data['data'].first['last'], 20_300
    assert_equal data['data'].first['denominatorSymbol'], 'USDT'
    assert_equal data['data'].first['numeratorSymbol'], 'BTC'
    assert_equal data['data'].first['order'], 2_000
  end

  def test_ticker_pairs_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'ticker',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_pairs

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end

  def test_ticker_currencies
    BtcTurk.reset_config

    stub = stub_request(path: 'ticker/currency',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/ticker_currencies', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_currencies

    data = operation.success

    assert operation.success?
    assert_equal data.count, 57
    assert_equal data.first.class.name, 'BtcTurk::Objects::Ticker'
    assert_equal data.first.pair, 'BTCUSDT'
    assert_equal data.first.pairNormalized, 'BTC_USDT'
    assert_equal data.first.timestamp, 1_657_049_826_202
    assert_equal data.first.last, 20_300
    assert_equal data.first.denominatorSymbol, 'USDT'
    assert_equal data.first.numeratorSymbol, 'BTC'
    assert_equal data.first.order, 2_000
  end

  def test_ticker_currencies_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'ticker/currency',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_currencies

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_ticker_currencies_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'ticker/currency',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/ticker_currencies', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_currencies

    data = operation.success

    assert operation.success?
    assert_equal data['data'].count, 57
    assert_equal data['data'].first['pair'], 'BTCUSDT'
    assert_equal data['data'].first['pairNormalized'], 'BTC_USDT'
    assert_equal data['data'].first['timestamp'], 1_657_049_826_202
    assert_equal data['data'].first['last'], 20_300
    assert_equal data['data'].first['denominatorSymbol'], 'USDT'
    assert_equal data['data'].first['numeratorSymbol'], 'BTC'
    assert_equal data['data'].first['order'], 2_000
  end

  def test_ticker_currencies_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'ticker/currency',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ticker_currencies

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end

  def test_orderbook
    BtcTurk.reset_config

    stub = stub_request(path: 'orderbook?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/orderbook', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.orderbook(pair_symbol: 'BTCUSDT')

    data = operation.success

    assert operation.success?
    assert_equal data.timestamp, 1_657_052_334_812.0
    assert_equal data.bids.count, 100
  end

  def test_orderbook_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'orderbook?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.orderbook(pair_symbol: 'BTCUSDT')

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_orderbook_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'orderbook?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/orderbook', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.orderbook(pair_symbol: 'BTCUSDT')

    data = operation.success

    assert operation.success?
    assert_equal data.dig('data', 'timestamp'), 1_657_052_334_812.0
    assert_equal data.dig('data', 'bids').count, 100
  end

  def test_orderbook_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'orderbook?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.orderbook(pair_symbol: 'BTCUSDT')

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end

  def test_trades
    BtcTurk.reset_config

    stub = stub_request(path: 'trades?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/trades', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.trades(pair_symbol: 'BTCUSDT')

    data = operation.success

    assert operation.success?
    assert_equal data.count, 50
    assert_equal data.first.pair, 'BTCUSDT'
    assert_equal data.first.pairNormalized, 'BTC_USDT'
    assert_equal data.first.numerator, 'BTC'
    assert_equal data.first.denominator, 'USDT'
    assert_equal data.first.date, 1_657_053_670_308
    assert_equal data.first.class.name, 'BtcTurk::Objects::Trade'
  end

  def test_trades_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'trades?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.trades(pair_symbol: 'BTCUSDT')

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_trades_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'trades?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'public/trades', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.trades(pair_symbol: 'BTCUSDT')

    data = operation.success

    assert operation.success?
    assert_equal data['data'].count, 50
    assert_equal data['data'].first['pair'], 'BTCUSDT'
    assert_equal data['data'].first['pairNormalized'], 'BTC_USDT'
    assert_equal data['data'].first['numerator'], 'BTC'
    assert_equal data['data'].first['denominator'], 'USDT'
    assert_equal data['data'].first['date'], 1_657_053_670_308
  end

  def test_trades_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'trades?pairSymbol=BTCUSDT',
                        method: :get,
                        client_type: :rest,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.trades(pair_symbol: 'BTCUSDT')

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end

  def test_ohlcs
    BtcTurk.reset_config

    stub = stub_request(path: 'ohlcs?pair=BTCUSDT&from=1638316800&to=1639526400',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'public/ohlcs', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ohlcs(pair: 'BTCUSDT', from: 1_638_316_800, to: 1_639_526_400)

    data = operation.success

    assert operation.success?
    assert_equal data.count, 14
    assert_equal data.first.pair, 'BTCUSDT'
    assert_equal data.first.class.name, 'BtcTurk::Objects::Ohlc'
  end

  def test_ohlcs_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'ohlcs?pair=BTCUSDT&from=1638316800&to=1639526400',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ohlcs(pair: 'BTCUSDT', from: 1_638_316_800, to: 1_639_526_400)

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_ohlcs_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'ohlcs?pair=BTCUSDT&from=1638316800&to=1639526400',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'public/ohlcs', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ohlcs(pair: 'BTCUSDT', from: 1_638_316_800, to: 1_639_526_400)

    data = operation.success

    assert operation.success?
    assert_equal data.count, 14
    assert_equal data.first['pair'], 'BTCUSDT'
    assert_equal data.first['time'], 1_638_316_800
    assert_equal data.first['open'], 57_042.0
    assert_equal data.first['high'], 58_990.0
    assert_equal data.first['low'], 56_500.0
  end

  def test_ohlcs_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'ohlcs?pair=BTCUSDT&from=1638316800&to=1639526400',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.ohlcs(pair: 'BTCUSDT', from: 1_638_316_800, to: 1_639_526_400)

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end

  def test_klines_history
    BtcTurk.reset_config

    stub = stub_request(path: 'klines?from=1602925320&resolution=60&symbol=BTCTRY&to=1603152000',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'public/klines_history', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.klines_history(from: 1_602_925_320, resolution: 60, symbol: 'BTCTRY', to: 1_603_152_000)

    data = operation.success

    assert operation.success?
    assert_equal data.t.count, 64
    assert_equal data.h.count, 64
    assert_equal data.o.count, 64
    assert_equal data.l.count, 64
    assert_equal data.c.count, 64
    assert_equal data.v.count, 64
  end

  def test_klines_history_while_something_goes_wrong
    BtcTurk.reset_config

    stub = stub_request(path: 'klines?from=1602925320&resolution=60&symbol=BTCTRY&to=1603152000',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.klines_history(from: 1_602_925_320, resolution: 60, symbol: 'BTCTRY', to: 1_603_152_000)

    error = operation.failure

    assert operation.failure?
    assert_equal error.message, 'Something goes wrong'
    assert_equal error.code, 123_456_789
    assert_equal error.status, 422
    assert error.class.name, 'BtcTurk::Objects::Error'
  end

  def test_klines_history_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'klines?from=1602925320&resolution=60&symbol=BTCTRY&to=1603152000',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'public/klines_history', status: 200))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.klines_history(from: 1_602_925_320, resolution: 60, symbol: 'BTCTRY', to: 1_603_152_000)

    data = operation.success

    assert operation.success?
    assert_equal data['t'].count, 64
    assert_equal data['h'].count, 64
    assert_equal data['o'].count, 64
    assert_equal data['l'].count, 64
    assert_equal data['c'].count, 64
    assert_equal data['v'].count, 64
  end

  def test_klines_history_while_something_goes_wrong_with_raw_response
    BtcTurk.reset_config

    BtcTurk.config.raw_response = true
    stub = stub_request(path: 'klines?from=1602925320&resolution=60&symbol=BTCTRY&to=1603152000',
                        method: :get,
                        client_type: :graphql,
                        response: stub_response(fixture: 'error', status: 422))

    client = BtcTurk::Client.new(api_key: nil, adapter: :test, stubs: stub)
    operation = client.public.klines_history(from: 1_602_925_320, resolution: 60, symbol: 'BTCTRY', to: 1_603_152_000)

    error = operation.failure

    assert operation.failure?
    assert_equal error['message'], 'Something goes wrong'
    assert_equal error['code'], 123_456_789
  end
end

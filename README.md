[![Gem Version](https://badge.fury.io/rb/btc_turk.svg)](https://badge.fury.io/rb/btc_turk)
![test](https://github.com/nejdetkadir/btc-turk/actions/workflows/test.yml/badge.svg?branch=main)
![rubocop](https://github.com/nejdetkadir/btc-turk/actions/workflows/rubocop.yml/badge.svg?branch=main)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
![Ruby Version](https://img.shields.io/badge/ruby_version->=_2.7.0-blue.svg)

# BtcTurk
Ruby wrapper for [BtcTurk API](https://docs.btcturk.com/)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'btc_turk', github: 'nejdetkadir/btc-turk', branch: 'main'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install btc_turk

## Configuration
```ruby
BtcTurk.configure do |config|
  config.logger = ::Logger.new($stdout).tap { |d| d.level = Logger::DEBUG }
  config.raw_response = false
  config.default_limit = 100
end

BtcTurk.config.logger = ::Logger.new($stdout).tap { |d| d.level = Logger::DEBUG }
BtcTurk.config.raw_response = true
BtcTurk.config.default_limit = 100
```


## Usage
To access the API, you'll need to create a BtcTurk::Client and pass in your API key. You can find your API key at [https://developers.forem.com/api](https://developers.forem.com/api)

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])
```
The client then gives you access to each of the resources.

## Resources
The gem maps as closely as we can to the DEV API so you can easily convert API examples to gem code.

Responses are returning as objects like `BtcTurk::Objects::Foo` with using [dry-monads](https://github.com/dry-rb/dry-monads) gem for easly error handling. In addition objects are inherited from [dry-struct](https://github.com/dry-rb/dry-struct) gem for easly creating objects with attributes as type safetly.

```ruby
# Sample request with dry-monads

client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

operation = client.public.exchange_info

if operation.success?
  exchange_info = operation.success

  exchange_info.symbols.first.id
  # => 123

  exchange_info.symbols.first.name
  # => BTC
end

if operation.failure?
  error = operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

## Public Endpoints
### Exchange Info
Gets a list of all known currencies. 
You can use exchangeinfo endpoint for all tradable pairs and their quantity or price scales.

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

operation = client.public.exchange_info

if operation.success?
  exchange_info = operation.success
  # => #<BtcTurk::Objects::ExchangeInfo ...>
  
  exchange_info.timezone
  # => "UTC"

  exchange_info.server_time
  # => 1589788983

  exchange_info.symbols.first
  # => #<BtcTurk::Objects::ExchangeInfo::Symbol ...>

  exchange_info.symbols.first.id
  # => 123

  exchange_info.symbols.first.name
  # => BTCTRY

  exchange_info.symbols.first.nameNormalized
  # => "BTC_TRY"

  exchange_info.symbols.first.status
  # => "TRADING"

  exchange_info.symbols.first.numerator
  # => "BTC"

  exchange_info.symbols.first.denominator
  # => "TRY"

  exchange_info.symbols.first.numeratorScale
  # => 8

  exchange_info.symbols.first.denominatorScale
  # => 0

  exchange_info.symbols.first.hasFraction
  # => false

  exchange_info.symbols.first.filters.first
  # => #<BtcTurk::Objects::ExchangeInfo::Symbol::Filter ...>

  exchange_info.symbols.first.filters.first.filterType
  # => "PRICE_FILTER"

  exchange_info.symbols.first.filters.first.minPrice
  # => "0.0000000000001"

  exchange_info.symbols.first.filters.first.minPrice
  # => "10000000"

  exchange_info.symbols.first.filters.first.tickSize
  # => "10"

  exchange_info.symbols.first.filters.first.minExchangeValue
  # => "99.91"

  exchange_info.symbols.first.filters.first.minAmount
  # => nil

  exchange_info.symbols.first.filters.first.maxAmount
  # => nil

  exchange_info.symbols.first.forderMethods
  # => ["MARKET", "LIMIT", "STOP_MARKET", "STOP_LIMIT"]

  exchange_info.symbols.first.displayFormat
  # => "#,###"

  exchange_info.symbols.first.commissionFromNumerator
  # => false

  exchange_info.symbols.first.order
  # => 1000

  exchange_info.symbols.first.priceRounding
  # => false

  exchange_info.symbols.first.isNew
  # => false

  exchange_info.symbols.first.marketPriceWarningThresholdPercentage
  # => 0.25

  exchange_info.symbols.first.maximumOrderAmount
  # => nil

  exchange_info.symbols.first.maximumLimitOrderPrice
  # => 3764580.0

  exchange_info.symbols.first.minimumLimitOrderPrice
  # => 37645.8

  exchange_info.currencies.first
  # => #<BtcTurk::Objects::ExchangeInfo::Currency ...>

  exchange_info.currencies.first.id
  # => 1

  exchange_info.currencies.first.symbol
  # => "TRY"

  exchange_info.currencies.first.minWithdrawal
  # => 10.0

  exchange_info.currencies.first.minDeposit
  # => 0.0

  exchange_info.currencies.first.precision
  # => 2

  exchange_info.currencies.first.address
  # => #<BtcTurk::Objects::ExchangeInfo::Currency::Address minLen=nil maxLen=nil>

  exchange_info.currencies.first.address.minLen
  # => nil

  exchange_info.currencies.first.address.maxLen
  # => nil

  exchange_info.currencies.first.currencyType
  # => "FIAT"

  exchange_info.currencies.first.tag
  # => #<BtcTurk::Objects::ExchangeInfo::Currency::Tag enable=false name=nil minLen=nil maxLen=nil>

  exchange_info.currencies.first.tag.enable
  # => false

  exchange_info.currencies.first.tag.name
  # => nil

  exchange_info.currencies.first.tag.minLen
  # => nil

  exchange_info.currencies.first.tag.maxLen
  # => nil

  exchange_info.currencies.first.color
  # => "#04964e"

  exchange_info.currencies.first.isAddressRenewable
  # => false

  exchange_info.currencies.first.getAutoAddressDisabled
  # => true

  exchange_info.currencies.first.isPartialWithdrawalEnabled
  # => true

  exchange_info.currencies.first.isNew
  # => false

  exchange_info.currencyOperationBlocks
  # => [#<BtcTurk::Objects::ExchangeInfo::CurrencyOperationBlock ...>]

  exchange_info.currencyOperationBlocks.first
  # => #<BtcTurk::Objects::ExchangeInfo::CurrencyOperationBlock currencySymbol="Btc" withdrawalDisabled=false depositDisabled=false>

  exchange_info.currencyOperationBlocks.first.currencySymbol
  # => "Btc"

  exchange_info.currencyOperationBlocks.first.withdrawalDisabled
  # => false

  exchange_info.currencyOperationBlocks.first.depositDisabled
  # => false
else
  error = operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

### Ticker
Gets snapshot information about the last trade (tick), best bid/ask and 24h volume.
Using the pair_symbol parameter, you can send a request for a single pair.

- If pairSymbol is not set, ticker for all pairs will be returned in a json array.

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

ticker_pairs_operation = client.public.ticker_pairs(pair_symbol: 'BTCTRY')

if ticker_pairs_operation.success?
  ticker_pairs = ticker_pairs_operation.success

  ticker_pairs
  # => [#<BtcTurk::Objects::Ticker ...>]

  ticker_pairs.first
  # => #<BtcTurk::Objects::Ticker ...>

  ticker_pairs.first.pair
  # => "BTCUSDT"

  ticker_pairs.first.pairNormalized
  # => "BTC_USDT"

  ticker_pairs.first.timestamp
  # => 1657282036729

  ticker_pairs.first.last
  # => 21527

  ticker_pairs.first.high
  # => 22425

  ticker_pairs.first.low
  # => 20369

  ticker_pairs.first.bid
  # => 21525

  ticker_pairs.first.ask
  # => 21555

  ticker_pairs.first.open
  # => 20472

  ticker_pairs.first.volume
  # => 196.33191929

  ticker_pairs.first.average
  # => 21497

  ticker_pairs.first.daily
  # => 1083

  ticker_pairs.first.dailyPercent
  # => 5.15

  ticker_pairs.first.denominatorSymbol
  # => "USDT"

  ticker_pairs.first.numeratorSymbol
  # => "BTC"

  ticker_pairs.first.order
  # => 2000
else
  error = ticker_pairs_operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end


ticker_currencies_operation = client.public.ticker_currencies(symbol: 'USDT')

if ticker_currencies_operation.success?
  ticker_currencies = ticker_currencies_operation.success

  ticker_currencies
  # => [#<BtcTurk::Objects::Ticker ...>]

  ticker_currencies.first
  # => #<BtcTurk::Objects::Ticker ...>

  ticker_currencies.first.pair
  # => "BTCUSDT"

  ticker_currencies.first.pairNormalized
  # => "BTC_USDT"

  ticker_currencies.first.timestamp
  # => 1657282036729

  ticker_currencies.first.last
  # => 21527

  ticker_currencies.first.high
  # => 22425

  ticker_currencies.first.low
  # => 20369

  ticker_currencies.first.bid
  # => 21525

  ticker_currencies.first.ask
  # => 21555

  ticker_currencies.first.open
  # => 20472

  ticker_currencies.first.volume
  # => 196.33191929

  ticker_currencies.first.average
  # => 21497

  ticker_currencies.first.daily
  # => 1083

  ticker_currencies.first.dailyPercent
  # => 5.15

  ticker_currencies.first.denominatorSymbol
  # => "USDT"

  ticker_currencies.first.numeratorSymbol
  # => "BTC"

  ticker_currencies.first.order
  # => 2000
else
  error = ticker_currencies_operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

### Order Book
In case of a system failure and delays in real time orderbook data, this endpoint will return HTTP 503 in order to prevent false market data feed to clients.

Get a list of all open orders for a product.
- 2 parameters are used for orderbook, pair_symbol and limit
- If limit parameter is not set, default 100 orders are listed.

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

orderbook_operation = client.public.orderbook(pair_symbol: 'BTCTRY', limit: BtcTurk.default_limit)

if orderbook_operation.success?
  orderbook = orderbook_operation.success

  orderbook
  # => #<BtcTurk::Objects::OrderBook ...>

  orderbook.timestamp
  # => 1657283041454.0

  orderbook.bids
  # => [["377537.00", "0.06306746"], ["377536.00", "0.00109383"]]

  orderbook.bids.count
  # => 100

  orderbook.bids.first
  # => ["377294.00", "0.01773078"]
else
  error = orderbook_operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

### Trades
Gets a list the latest trades for a product.
- 2 parameters can be used for the trades enpoint:
pairSymboland last
- You can send pair_symbol parameter in this format BTCUSDT
- Max of 50 latest trades can be used for the trades parameter

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

trades_operation = client.public.orderbook(pair_symbol: 'BTCTRY', limit: BtcTurk.default_limit)

if trades_operation.success?
  trades = trades_operation.success

  trades
  # => [#<BtcTurk::Objects::Trade ...>]

  trades.first
  # => #<BtcTurk::Objects::Trade ...>

  trades.first.pair
  # => "BTCTRY"

  trades.first.pairNormalized
  # => "BTC_TRY"

  trades.first.numerator
  # => "BTC"

  trades.first.denominator
  # => "TRY"

  trades.first.date
  # => 1657283492916

  trades.first.tid
  # => "100163792331822763"

  trades.first.price
  # => "375052"

  trades.first.amount
  # => "0.02098317"

  trades.first.side
  # => "buy"
else
  error = trades_operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

### OHLC Data
This is the data that is shown in our charting interface.
- open, high, low, close, volume, total and average information can be viewed with OHLC enpoint.

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

ohlcs_operation = client.public.ohlcs(pair: 'BTCTRY', from: 1638316800, to: 1639526400)

if ohlcs_operation.success?
  ohlcs = ohlcs_operation.success

  ohlcs
  # => [#<BtcTurk::Objects::Ohlc ...>]

  ohlcs.first
  # => #<BtcTurk::Objects::Ohlc ...>

  ohlcs.first.pair
  # => "BTCTRY"

  ohlcs.first.time
  # => 1638316800

  ohlcs.first.open
  # => 754536.0

  ohlcs.first.high
  # => 782000.0

  ohlcs.first.low
  # => 725000.0

  ohlcs.first.close
  # => 772313.0

  ohlcs.first.volume
  # => 797.511098204054

  ohlcs.first.total
  # => 607561925.373768

  ohlcs.first.average
  # => 761822.53

  ohlcs.first.dailyChangeAmount
  # => 17777.0

  ohlcs.first.dailyChangePercentage
  # => 2.36
else
  error = ohlcs_operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

### Kline Data
Kline candlestick bars for a symbol.
- Kline history information can be viewed with kline endpoint.
- Can be used with symbol, resolution, from and to parameters
- You can get minute, hourly and daily data with resolution parameter

```ruby
client = BtcTurk::Client.new(api_key: ENV['BTCTURK_API_KEY'])

klines_history_operation = client.public.klines_history(symbol: 'BTCTRY', resolution: 60, from: 1602925320, to: 1603152000)

if klines_history_operation.success?
  klines_history = klines_history_operation.success

  klines_history
  # => #<BtcTurk::Objects::Kline ...>

  klines_history.t
  # => [1602925200, 1602928800, 1602932400]

  klines_history.h
  # => [90599.0, 90700.0, 90661.0]

  klines_history.o
  # => [90396. 0,90480.0, 90594.0]

  klines_history.l
  # => [90312.0, 90340.0, 90475.0]

  klines_history.c
  # => [90551.0, 90599.0, 90661.0]

  klines_history.v
  # => [8.09832571113657, 6.48704214645841, 4.98000450055406]
else
  error = klines_history_operation.failure
  # => #<BtcTurk::Objects::Error ...>

  error.message
  # => "Something goes wrong"

  error.code
  # => 123

  error.status
  # => 422
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nejdetkadir/btc-turk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/nejdetkadir/btc-turk/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BtcTurk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nejdetkadir/btc-turk/blob/main/CODE_OF_CONDUCT.md).

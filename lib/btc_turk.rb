# frozen_string_literal: true

require 'faraday'
require 'dry-configurable'
require 'dry/configurable/test_interface'
require 'awesome_print'
require_relative 'btc_turk/version'

module BtcTurk
  extend Dry::Configurable

  enable_test_interface

  setting :logger, default: nil, reader: true
  setting :raw_response, default: false, reader: true
  setting :default_limit, default: 100, reader: true

  require_relative 'btc_turk/helpers'
  require_relative 'btc_turk/errors'
  require_relative 'btc_turk/client'
  require_relative 'btc_turk/decorators/client/decorator'
  require_relative 'btc_turk/decorators/client/graphql_client'
  require_relative 'btc_turk/decorators/client/rest_client'
  require_relative 'btc_turk/resources/base'
  require_relative 'btc_turk/resources/public'
  require_relative 'btc_turk/objects/base'
  require_relative 'btc_turk/objects/error'
  require_relative 'btc_turk/objects/exchange_info'
  require_relative 'btc_turk/objects/ticker'
  require_relative 'btc_turk/objects/orderbook'
  require_relative 'btc_turk/objects/trade'
  require_relative 'btc_turk/objects/ohlc'
  require_relative 'btc_turk/objects/kline'
end

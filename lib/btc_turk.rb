# frozen_string_literal: true

require 'faraday'
require 'dry-configurable'
require 'awesome_print'
require_relative 'btc_turk/version'

module BtcTurk
  extend Dry::Configurable

  setting :logger, default: nil, reader: true
  setting :raw_response, default: false, reader: true

  require_relative 'btc_turk/helpers'
  require_relative 'btc_turk/errors'
  require_relative 'btc_turk/client'
  require_relative 'btc_turk/resources/base'
  require_relative 'btc_turk/objects/base'
  require_relative 'btc_turk/objects/error'
end

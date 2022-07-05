# frozen_string_literal: true

module BtcTurk
  module Objects
    class Orderbook < Base
      attribute :timestamp, Types::Integer | Types::Float
      attribute :bids, Types::Array.of(Types::Array.of(Types::String))
    end
  end
end

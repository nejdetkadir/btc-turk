# frozen_string_literal: true

module BtcTurk
  module Objects
    class Ticker < Base
      attribute :pair, Types::String
      attribute :pairNormalized, Types::String
      attribute :timestamp, Types::Integer
      attribute :last, Types::Integer | Types::Float
      attribute :high, Types::Integer | Types::Float
      attribute :low, Types::Integer | Types::Float
      attribute :bid, Types::Integer | Types::Float
      attribute :ask, Types::Integer | Types::Float
      attribute :open, Types::Integer | Types::Float
      attribute :volume, Types::Integer | Types::Float
      attribute :average, Types::Integer | Types::Float
      attribute :daily, Types::Integer | Types::Float
      attribute :dailyPercent, Types::Integer | Types::Float
      attribute :denominatorSymbol, Types::String
      attribute :numeratorSymbol, Types::String
      attribute :order, Types::Integer
    end
  end
end

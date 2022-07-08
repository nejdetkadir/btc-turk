# frozen_string_literal: true

module BtcTurk
  module Objects
    class Ohlc < Base
      attribute :pair, Types::String
      attribute :time, Types::Integer
      attribute :open, Types::Integer | Types::Float
      attribute :high, Types::Integer | Types::Float
      attribute :low, Types::Integer | Types::Float
      attribute :close, Types::Integer | Types::Float
      attribute :volume, Types::Integer | Types::Float
      attribute :total, Types::Integer | Types::Float
      attribute :average, Types::Integer | Types::Float
      attribute :dailyChangeAmount, Types::Integer | Types::Float
      attribute :dailyChangePercentage, Types::Float
    end
  end
end

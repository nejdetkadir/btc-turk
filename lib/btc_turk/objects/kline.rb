# frozen_string_literal: true

module BtcTurk
  module Objects
    class Kline < Base
      attribute :t, Types::Array.of(Types::Integer | Types::Float)
      attribute :h, Types::Array.of(Types::Integer | Types::Float)
      attribute :o, Types::Array.of(Types::Integer | Types::Float)
      attribute :l, Types::Array.of(Types::Integer | Types::Float)
      attribute :c, Types::Array.of(Types::Integer | Types::Float)
      attribute :v, Types::Array.of(Types::Integer | Types::Float)
    end
  end
end

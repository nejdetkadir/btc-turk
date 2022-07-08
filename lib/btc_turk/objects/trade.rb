# frozen_string_literal: true

module BtcTurk
  module Objects
    class Trade < Base
      attribute :pair, Types::String
      attribute :pairNormalized, Types::String
      attribute :numerator, Types::String
      attribute :denominator, Types::String
      attribute :date, Types::Integer
      attribute :tid, Types::String
      attribute :price, Types::String
      attribute :amount, Types::String
      attribute :side, Types::String
    end
  end
end

# frozen_string_literal: true

module BtcTurk
  module Objects
    class Error < Base
      attribute :status, Types::Integer
      attribute :message, Types::String
      attribute :code, Types::Integer
    end
  end
end

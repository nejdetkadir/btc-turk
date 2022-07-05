# frozen_string_literal: true

require 'dry-struct'

module Types
  include Dry.Types()
end

module BtcTurk
  module Objects
    class Base < Dry::Struct
      transform_keys(&:to_sym)
    end
  end
end

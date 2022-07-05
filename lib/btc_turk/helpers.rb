# frozen_string_literal: true

module BtcTurk
  class Helpers
    class << self
      def expected_response?(response, expected_status, skip_success_check: false)
        if skip_success_check
          response.status == expected_status
        else
          response.status == expected_status && response.body['success'] == true
        end
      end

      def create_collection(data:, type:)
        data.map { |item| type.new(item) }
      end
    end
  end
end

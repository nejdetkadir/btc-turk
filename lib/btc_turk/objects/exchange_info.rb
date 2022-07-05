# frozen_string_literal: true

module BtcTurk
  module Objects
    class ExchangeInfo < Base
      attribute :timeZone, Types::String
      attribute :serverTime, Types::Integer
      attribute :symbols, Types::Array do
        attribute :id, Types::Integer
        attribute :name, Types::String
        attribute :nameNormalized, Types::String
        attribute :status, Types::String
        attribute :numerator, Types::String
        attribute :denominator, Types::String
        attribute :numeratorScale, Types::Integer
        attribute :denominatorScale, Types::Integer
        attribute :hasFraction, Types::Bool
        attribute :filters, Types::Array do
          attribute :filterType, Types::String
          attribute :minPrice, Types::String
          attribute :maxPrice, Types::String
          attribute :tickSize, Types::String
          attribute :minExchangeValue, Types::String
          attribute :minAmount, Types::String.optional
          attribute :maxAmount, Types::String.optional
        end
        attribute :orderMethods, Types::Array.of(Types::String)
        attribute :displayFormat, Types::String
        attribute :commissionFromNumerator, Types::Bool
        attribute :order, Types::Integer
        attribute :priceRounding, Types::Bool
        attribute :isNew, Types::Bool
        attribute :marketPriceWarningThresholdPercentage, Types::Float
        attribute :maximumOrderAmount, Types::String.optional
        attribute :maximumLimitOrderPrice, Types::Float
        attribute :minimumLimitOrderPrice, Types::Float
      end
      attribute :currencies, Types::Array do
        attribute :id, Types::Integer
        attribute :symbol, Types::String
        attribute :minWithdrawal, Types::Float
        attribute :minDeposit, Types::Float
        attribute :precision, Types::Integer
        attribute :address do
          attribute :minLen, Types::Integer.optional
          attribute :maxLen, Types::Integer.optional
        end
        attribute :currencyType, Types::String
        attribute :tag do
          attribute :enable, Types::Bool
          attribute :name, Types::String.optional
          attribute :minLen, Types::Integer.optional
          attribute :maxLen, Types::Integer.optional
        end
        attribute :color, Types::String
        attribute :isAddressRenewable, Types::Bool
        attribute :getAutoAddressDisabled, Types::Bool
        attribute :isPartialWithdrawalEnabled, Types::Bool
        attribute :isNew, Types::Bool
      end
      attribute :currencyOperationBlocks, Types::Array do
        attribute :currencySymbol, Types::String
        attribute :withdrawalDisabled, Types::Bool
        attribute :depositDisabled, Types::Bool
      end
    end
  end
end

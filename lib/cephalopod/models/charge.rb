module Cephalopod
  module Models
    class Charge < Base

      attribute :value_exc_vat,   Types::Strict::Float
      attribute :value_inc_vat,   Types::Strict::Float
      attribute :valid_from,      Types::JSON::DateTime
      attribute :valid_to,        Types::JSON::DateTime

    end
  end
end
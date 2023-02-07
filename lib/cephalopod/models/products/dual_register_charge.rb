module Cephalopod
  module Models
    module Products
      class DualRegisterCharge < Base

        attribute :code,                        Types::Strict::String
        attribute :standing_charge_exc_vat,     Types::Coercible::Float
        attribute :standing_charge_inc_vat,     Types::Coercible::Float
        attribute :online_discount_exc_vat,     Types::Coercible::Float
        attribute :online_discount_inc_vat,     Types::Coercible::Float
        attribute :dual_fuel_discount_exc_vat,  Types::Coercible::Float
        attribute :dual_fuel_discount_inc_vat,  Types::Coercible::Float
        attribute :exit_fees_exc_vat,           Types::Coercible::Float
        attribute :exit_fees_inc_vat,           Types::Coercible::Float
        attribute :exit_fees_type,              Types::Strict::String
        attribute :day_unit_rate_exc_vat,       Types::Coercible::Float
        attribute :day_unit_rate_inc_vat,       Types::Coercible::Float
        attribute :night_unit_rate_exc_vat,     Types::Coercible::Float
        attribute :night_unit_rate_inc_vat,     Types::Coercible::Float

        attribute :links, Types::Strict::Array.of(Cephalopod::Models::Link)     

      end
    end
  end
end

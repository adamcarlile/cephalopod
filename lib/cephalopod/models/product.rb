module Cephalopod
  module Models
    class Product < Base

      attribute :code, Types::Strict::String
      attribute :full_name, Types::Strict::String
      attribute :display_name, Types::Strict::String
      attribute :description, Types::Strict::String
      attribute :is_variable, Types::Strict::Bool
      attribute :is_green, Types::Strict::Bool
      attribute :is_tracker, Types::Strict::Bool
      attribute :is_prepay, Types::Strict::Bool
      attribute :is_business, Types::Strict::Bool
      attribute :is_restricted, Types::Strict::Bool
      attribute :term, Types::Integer.optional
      attribute :brand, Types::Strict::String
      attribute :available_from, Types::Params::DateTime
      attribute :available_to, Types::Params::DateTime.optional
      attribute :tariffs_active_at, Types::Params::DateTime.optional
      attribute :single_register_electricity_tariffs, Types::Params::Hash.map(Types::Strict::Symbol, Types::Params::Hash.map(Types::Strict::Symbol, Cephalopod::Models::Products::SingleRegisterCharge)).optional
      attribute :dual_register_electricity_tariffs, Types::Params::Hash.map(Types::Strict::Symbol, Types::Params::Hash.map(Types::Strict::Symbol, Cephalopod::Models::Products::DualRegisterCharge)).optional
      attribute :single_register_gas_tariffs, Types::Params::Hash.map(Types::Strict::Symbol, Types::Params::Hash.map(Types::Strict::Symbol, Cephalopod::Models::Products::SingleRegisterCharge)).optional

      attribute :links, Types::Strict::Array.of(Cephalopod::Models::Link)

      alias_method :variable?, :is_variable
      alias_method :green?, :is_green
      alias_method :tracker?, :is_tracker
      alias_method :prepay?, :is_prepay
      alias_method :business?, :is_business
      alias_method :is_restricted?, :is_restricted

    end
  end
end

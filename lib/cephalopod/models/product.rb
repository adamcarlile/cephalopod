module Cephalopod
  module Models
    class Product < Base

      attribute :code, Types::Strict::String
      attribute :direction, Types::Strict::String
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
      attribute :links, Types::Strict::Array.of(Cephalopod::Models::Link)

      attribute :tariffs_active_at, Types::Params::DateTime.optional
      attribute :single_register_electricity_tariffs, Types::Params::Hash.map(Types::Strict::String, Types::Strict::String).optional

      private
      
      def full_resource
        links.detect {|x| x.self? }
      end

    end
  end
end

module Cephalopod
  module Models
    class ProductSummary < Base

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

      def details
        @details ||= Cephalopod::Repos::V1::Products::Resource.new.get(code: code)
      end

      alias_method :variable?, :is_variable
      alias_method :green?, :is_green
      alias_method :tracker?, :is_tracker
      alias_method :prepay?, :is_prepay
      alias_method :business?, :is_business
      alias_method :is_restricted?, :is_restricted

    end
  end
end

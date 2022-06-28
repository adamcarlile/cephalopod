module Cephalopod
  module Models
    class Link < Base

      attribute :href, Types::Strict::String
      attribute :method, Types::Strict::String
      attribute :rel, Types::Strict::String

      def self?
        rel == 'self'
      end

    end
  end
end

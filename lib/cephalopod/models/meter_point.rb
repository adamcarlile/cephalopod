module Cephalopod
  module Models
    class MeterPoint < Base

      attribute :gsp,           Types::Strict::String
      attribute :mpan,          Types::Strict::String
      attribute :profile_class, Types::Strict::Integer
      
    end
  end
end

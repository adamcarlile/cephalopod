module Cephalopod
  module Models
    class Consumption < Base

      attribute :consumption,     Types::Strict::Float
      attribute :interval_start,  Types::JSON::DateTime
      attribute :interval_end,    Types::JSON::DateTime
      
    end
  end
end

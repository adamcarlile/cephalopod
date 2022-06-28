module Cephalopod
  module Models
    class Base < Dry::Struct
      transform_keys(&:to_sym)
    end
  end
end
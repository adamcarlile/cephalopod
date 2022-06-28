module Cephalopod
  module Repos
    module V1
      module Products
        class Collection < Base

          model Cephalopod::Models::Product
          resource_route '/v1/products/'

        end
      end
    end
  end
end
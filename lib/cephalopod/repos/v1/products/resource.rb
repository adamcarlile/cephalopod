module Cephalopod
  module Repos
    module V1
      module Products
        class Resource < Base

          model Cephalopod::Models::Product
          resource_route '/v1/products/:code/'

        end
      end
    end
  end
end
module Cephalopod
  module Repos
    module V1
      module Products
        class Collection < Base

          model Cephalopod::Models::ProductSummary
          resource_route '/v1/products/'

          def variable
            select(:variable?)
          end

        end
      end
    end
  end
end
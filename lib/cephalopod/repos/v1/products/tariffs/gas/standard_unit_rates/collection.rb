module Cephalopod
  module Repos
    module V1
      module Tariffs
        module Gas
          module StandardUnitRates
            class Collection < Base

              model Cephalopod::Models::Charge
              resource_route '/v1/products/:product_code/gas-tariffs/:tariff_code/standard-unit-rates/'

            end
          end
        end
      end
    end
  end
end
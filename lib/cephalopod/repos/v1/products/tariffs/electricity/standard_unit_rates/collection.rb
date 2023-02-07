module Cephalopod
  module Repos
    module V1
      module Tariffs
        module Electricity
          module StandardUnitRates
            class Collection < Base

              model Cephalopod::Models::Charge
              resource_route '/v1/products/:product_code/electricity-tariffs/:tariff_code/standard-unit-rates/'

            end
          end
        end
      end
    end
  end
end
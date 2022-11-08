module Cephalopod
    module Repos
      module V1
        module GasMeterPoints
          module Consumption
            class Collection < Base
    
              model Cephalopod::Models::Consumption
              resource_route '/v1/gas-meter-points/:mpan/meters/:serial_number/consumption/'
    
            end
          end
        end
      end
    end
  end
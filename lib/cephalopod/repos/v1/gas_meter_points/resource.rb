module Cephalopod
    module Repos
      module V1
        module GasMeterPoints
          class Resource < Base
  
            model Cephalopod::Models::MeterPoint
            resource_route '/v1/gas-meter-points/:mpan/'
  
          end
        end
      end
    end
  end
module Cephalopod
    module Repos
      module V1
        module ElectricityMeterPoints
          module Consumption
            class Collection < Base
    
                model Cephalopod::Models::Consumption
                resource_route '/v1/electricity-meter-points/:mpan/meters/:serial_number/consumption/'
    
            end
          end
        end
      end
    end
  end
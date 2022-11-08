module Cephalopod
    module Repos
      module V1
        module GSP
          class Resource < Base
  
            model Cephalopod::Models::GSP
            resource_route '/v1/industry/grid-supply-points/'
  
          end
        end
      end
    end
  end
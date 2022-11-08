module Cephalopod
  module Repos
    module V1
      module ElectricityMeterPoints
        class Resource < Base

          model Cephalopod::Models::MeterPoint
          resource_route '/v1/electricity-meter-points/:mpan/'

        end
      end
    end
  end
end
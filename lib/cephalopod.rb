require 'active_support/all'
require 'dry-types'
require 'dry-struct'
require 'faraday'
require "mustermann"

require "cephalopod/version"

require "cephalopod/types"
require "cephalopod/adaptor"
require "cephalopod/response"

require "cephalopod/models/base"
require "cephalopod/models/link"
require "cephalopod/models/charge"
require "cephalopod/models/products/dual_register_charge"
require "cephalopod/models/products/single_register_charge"
require "cephalopod/models/product_summary"
require "cephalopod/models/product"
require "cephalopod/models/meter_point"
require "cephalopod/models/consumption"
require "cephalopod/models/gsp"

require "cephalopod/repos/base"
require "cephalopod/repos/v1/products/collection"
require "cephalopod/repos/v1/products/resource"

require "cephalopod/repos/v1/products/tariffs/electricity/day_unit_rates/collection"
require "cephalopod/repos/v1/products/tariffs/electricity/night_unit_rates/collection"
require "cephalopod/repos/v1/products/tariffs/electricity/standard_unit_rates/collection"
require "cephalopod/repos/v1/products/tariffs/electricity/standing_charges/collection"
require "cephalopod/repos/v1/products/tariffs/gas/standard_unit_rates/collection"
require "cephalopod/repos/v1/products/tariffs/gas/standing_charges/collection"

require "cephalopod/repos/v1/electricity_meter_points/resource"
require "cephalopod/repos/v1/electricity_meter_points/consumption/collection"
require "cephalopod/repos/v1/gas_meter_points/resource"
require "cephalopod/repos/v1/gas_meter_points/consumption/collection"

require "cephalopod/repos/v1/gsp/resource"


module Cephalopod
  class Error < StandardError; end
  extend self

  def configure(&block)
    yield(config)
  end

  def config
    @config ||= {
      base_url: 'https://api.octopus.energy',
      api_key:  'api_key'
    }
  end

  def client
    @client ||= Cephalopod::Adaptor.new(**config)
  end

  def products(*args)
    Cephalopod::Repos::V1::Products::Collection.new.get(*args)
  end

  def electrical_consumption(mpan:, serial_number:, **args)
    Cephalopod::Repos::V1::ElectricityMeterPoints::Consumption::Collection.new.get(mpan: mpan, serial_number: serial_number, **args)
  end

  def gas_consumption(mpan:, serial_number:, **args)
    Cephalopod::Repos::V1::GasMeterPoints::Consumption::Collection.new.get(mpan: mpan, serial_number: serial_number, **args)
  end

  def grid_supply_point(postcode:)
    Cephalopod::Repos::V1::GSP::Resource.new.get(query: {postcode: postcode})
  end

end

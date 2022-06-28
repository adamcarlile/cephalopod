require 'active_support/all'
require 'dry-types'
require 'dry-struct'
require 'faraday'
require "mustermann"
require 'pry'

require "cephalopod/version"

require "cephalopod/types"
require "cephalopod/adaptor"
require "cephalopod/response"

require "cephalopod/models/base"
require "cephalopod/models/link"
require "cephalopod/models/product"

require "cephalopod/repos/base"
require "cephalopod/repos/v1/products/collection"

module Cephalopod
  class Error < StandardError; end
  extend self

  def configure(&block)
    yield(config)
  end

  def config
    @config ||= {
      base_url: 'https://api.octopus.energy',
      api_key:  'sk_live_w823Gn24vek120vYwZUBBPMp'
    }
  end

  def client
    @client ||= Cephalopod::Adaptor.new(**config)
  end
end

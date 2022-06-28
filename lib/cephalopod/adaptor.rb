module Cephalopod
  class Adaptor

    attr_reader :config
    def initialize(**config)
      @config = config
    end

    delegate :get, :post, :put, :patch, :delete, :run_request, to: :connection

    private

    def connection
      @connection ||= Faraday.new(url: config[:base_url]) do |f|
        f.headers['User-Agent'] = config.fetch(:user_agent, "Cephalopod Ruby Client v#{Cephalopod::VERSION}")
        f.request :authorization, :basic, config[:api_key], ""
        f.request :json

        f.response :json, parser_options: { symbolize_names: true }
        f.response :raise_error

        f.adapter :net_http
      end
    end
    
  end
end
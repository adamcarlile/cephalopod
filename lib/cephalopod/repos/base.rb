module Cephalopod
  module Repos
    class Base
      class << self
        attr_accessor :default_model, :default_resource_route
 
        def model(model)
          self.default_model = model
        end
  
        def resource_route(path)
          self.default_resource_route = path
        end

        def unsupported(*methods)
          self.class_eval do
            methods.each { |method| alias_method method, :undefined }
          end
        end

        def route
          @route ||= Mustermann.new(default_resource_route)
        end
      end

      delegate :default_model, :default_resource_route, :route, to: :class

      attr_reader :resource_route, :model

      def initialize(client: Cephalopod.client, 
                      model: default_model, 
                      resource_route: default_resource_route)
        @client, @model, @resource_route = client, model, resource_route
      end

      def get(method: :get, headers: {}, query: {}, body: nil, **params, &block)
        @get ||= parse_response(@client.run_request(method, build_path(query: query, **params), body, headers, &block))
      end

      private

      def parse_response(response, &block)
        Cephalopod::Response.new(response: response, repo: self, &block)
      end

      def build_path(query: {}, **params)
        URI.parse(route.expand(params)).tap do |uri|
          uri.query = query.to_query unless query.blank?
        end.to_s
      end

    end
  end
end

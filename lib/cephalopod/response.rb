module Cephalopod
  class Response < SimpleDelegator
    module Pagination
      def next_page
        @repo.get(query: query.merge({ page: @response.body[:page].succ }))
      end

      def previous_page
        @repo.get(query: query.merge({page: @response.body[:page].pred }))
      end

      def get_page(number)
        @repo.get(query: query.merge({page: number}))
      end

      def payload
        @response.body[:results]
      end

      def model_parser
        payload.map {|x| @repo.model.new(x) } 
      end

    end

    def initialize(response:, repo:, &block)
      @response = response
      @repo     = repo
      extend Pagination if paginated?
      super(block_given? ? yield(@response.body) : parse_response)
    end

    def paginated?
      @response.body.is_a?(Hash) && pagination_links? && @response.body.key?(:results)
    end

    def pagination_links?
      @response.body.key?(:next) || @response.body.key?(:previous)
    end

    def query
      @query ||= URI::decode_www_form(@response.env.url.query).to_h.symbolize_keys
    end

    def payload
      @response.body
    end

    protected

    def parse_response
      @repo.model ? model_parser : payload
    end

    def model_parser
      @repo.model.new(payload)
    end

  end
end

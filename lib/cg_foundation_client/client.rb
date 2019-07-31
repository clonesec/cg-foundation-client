require 'faraday'
require 'faraday_middleware'

require 'cg_foundation_client/configuration'

module CgFoundationClient
  class Client
    attr_reader :configuration

    # options
    #   api_key Your API key
    #   api_version default v2
    #   timeout default 60 (seconds)
    def initialize(configuration = Configuration.new)
      @configuration = configuration
    end

    def connection(url = nil)
      url ||= "#{@configuration.http_method}://#{@configuration.host}:#{@configuration.port}/"

      Faraday.new(url: url) do |faraday|
        faraday.request :json
        # faraday.ssl.verify = false
        faraday.authorization :Bearer, @configuration.api_key
        faraday.headers['Authorization']
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['Accept'] = 'application/json'
        faraday.options.timeout = @configuration.timeout
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end

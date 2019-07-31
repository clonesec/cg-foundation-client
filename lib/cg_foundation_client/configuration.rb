module CgFoundationClient
  class Configuration
    attr_accessor :api_version, :timeout, :api_key, :host, :port, :http_method

    def initialize(options = nil)
      options = options ? default_options.merge(options) : default_options

      return unless options.is_a?(Hash)

      options.each do |config_name, config_value|
        send("#{config_name}=", config_value)
      end
    end

    private

    def default_options
      {
          api_version: 'v1',
          timeout: 60,
          http_method: "http",
          api_key: nil,
          host: 'localhost',
          port: nil
      }
    end
  end
end
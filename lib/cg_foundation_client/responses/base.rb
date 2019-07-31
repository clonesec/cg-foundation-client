require 'json'

module CgFoundationClient
  module Responses
    class Base

      attr_accessor :body, :status
      attr_accessor :raw_response

      # @param response Faraday::Response
      def initialize(response)
        @raw_response = response
        @body = JSON.parse(response.body)
        @status = response.status
      end
    end
  end
end
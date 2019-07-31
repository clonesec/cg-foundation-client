require 'cg_foundation_client/version'
require 'cg_foundation_client/client'

module CgFoundationClient
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.client
    @client = CgFoundationClient::Client.new(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
RSpec.describe CgFoundationClient do
  before :all do
    CgFoundationClient.configure do |config|
      config.timeout = 20
      config.api_key = 'API_KEY_1'
    end
  end

  it "has a version number" do
    expect(CgFoundationClient::VERSION).not_to be nil
  end
end

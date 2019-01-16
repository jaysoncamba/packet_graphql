module RequestHelper
  def parsed_response
    JSON.parse(response.body).with_indifferent_access
  end
end

RSpec.configure do |config|
  config.include RequestHelper, type: :request
end

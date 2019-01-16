require 'sinatra/base'

class FakePacket < Sinatra::Base
  get('/operating-systems') { json_response 200, fixture(:operating_systems) }
  get('/projects/:id/plans') { json_response 200, fixture(:plans) }
  get('/projects/:id/facilities') { json_response 200, fixture(:facilities) }
  get('/projects/:id/devices') { json_response 200, fixture(:devices) }
  get('/devices/:id') do |id|
    devices = JSON.parse(fixture(:devices))['devices']
    json_response 200, devices.first.to_json
  end
  post('/projects/:id/devices') do |id|
    devices = JSON.parse(fixture(:devices))['devices']
    json_response 200, devices.first.to_json
  end
  delete('/devices/:id') { json_response 200, fixture(:delete_device) }

  private

  def json_response(response_code, body = nil)
    content_type :json
    status response_code
    body
  end

  def fixture(name)
    File.open("#{File.join(File.dirname(__FILE__), '..', 'fixtures', 'packet', name.to_s)}.json", 'rb').read
  end
end

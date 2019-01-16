describe 'projectDevice request', type: :request do
  let(:device_id) { FFaker::Internet.slug }
  let(:query) do
    <<-GRAPHQL
      query{
        projectDevice(deviceId: "#{device_id}") {
          id
          hostname
          state
          tags
          iqn
        }
      }
    GRAPHQL
  end

  subject do
    post '/graphql', params: { query: query }, headers: headers
    parsed_response
  end

  context 'when using authenticated users' do
    include_context 'logged in headers'
    let(:expected_response) do
      {
        "data": {
          "projectDevice": {
            "id": "3195df4f-d1c9-4171-a1aa-378456d341ee",
            "hostname": "3195df4f.packethost.net",
            "state": "active",
            "tags": [],
            "iqn": "iqn.2019-01.net.packet:device.3195df4f"
          }
        }
      }
    end

    it 'returns collection of projectDevices' do
      is_expected.to match(expected_response)
    end
  end

  # TODO: add sad path
end

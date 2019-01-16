describe 'createDevice request', type: :request do
  let(:device_id) { FFaker::Internet.slug }
  let(:input) do
    {
      projectId: FFaker::Internet.slug,
      planSlug: FFaker::Internet.slug,
      operatingSystemSlug: FFaker::Internet.slug,
      facilityCode: FFaker::Internet.slug
    }
  end

  let(:mutation) do
    <<-GRAPHQL
      mutation($input: CreateDeviceInput!) {
        createDevice(input: $input){
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
    post '/graphql', params: { query: mutation, variables: { input: input } }, headers: headers
    parsed_response
  end

  context 'valid parameters' do
    include_context 'logged in headers'

    let(:expected_response) do
      {
        "data": {
          "createDevice": {
            "id": "3195df4f-d1c9-4171-a1aa-378456d341ee",
            "hostname": "3195df4f.packethost.net",
            "state": "active",
            "tags": [],
            "iqn": "iqn.2019-01.net.packet:device.3195df4f"
          }
        }
      }
    end

    it 'returns success' do
      is_expected.to match(expected_response)
    end
  end

  # TODO: add sad path
end

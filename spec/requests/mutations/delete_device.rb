describe 'deleteDevice request', type: :request do
  let(:device_id) { FFaker::Internet.slug }
  let(:input) do
    { deviceId: device_id }
  end

  let(:mutation) do
    <<-GRAPHQL
      mutation ($input: DeleteDeviceInput!){
        deleteDevice(
          input: $input
        ) {
          success
        }
      }
    GRAPHQL
  end

  subject do
    post '/graphql', params: { query: mutation, variables: { input: input } }, headers: headers
    parsed_response
  end

  context 'when device Id is existing' do
    include_context 'logged in headers'

    let(:expected_response) do
      {
        data: {
          deleteDevice: {
            success: true
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

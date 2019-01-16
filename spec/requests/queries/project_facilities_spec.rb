describe 'projectFacilities request', type: :request do
  let(:project_id) { FFaker::Internet.slug }
  let(:query) do
    <<-GRAPHQL
      query {
        projectFacilities(projectId: "#{project_id}"){
          edges {
            node {
              id
              name
              code
              features
            }
          }
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
          "projectFacilities": {
            "edges": [
              {
                "node": {
                  "id": '92d199e7-3203-4df1-afb5-f16a890150ac',
                  "name": 'Toronto, ON, CA',
                  "code": 'yyz1',
                  "features": %w[
                    baremetal
                    layer_2
                  ]
                }
              }
            ]
          }
        }
      }
    end

    it 'returns collection of projectFacilities' do
      is_expected.to match(expected_response)
    end
  end

  # TODO: add sad path
end

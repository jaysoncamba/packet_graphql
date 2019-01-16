describe 'projectPlans request', type: :request do
  let(:project_id) { FFaker::Internet.slug }
  let(:query) do
    <<-GRAPHQL
      query {
        projectPlans(projectId: "#{project_id}"){
          edges {
            node {
              id
              slug
              name
              description
              line
              specs
              pricing
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
          "projectPlans": {
            "edges": [
              {
                "node": {
                  "id": 'd2829bc4-4c00-461c-9125-ec8cefb609f5',
                  "slug": 'baremetal_2a4',
                  "name": 'Type 2A4',
                  "description": 'Our Type 2A4 configuration is a 56-core dual socket ARM server.',
                  "line": 'baremetal',
                  "specs": [
                    [
                      'cpus',
                      [
                        {
                          "count": 2,
                          "type": '28-core ThunderX2 @ 2.0Ghz'
                        }
                      ]
                    ],
                    [
                      'memory',
                      {
                        "total": '256GB'
                      }
                    ],
                    [
                      'drives',
                      [
                        {
                          "count": 1,
                          "size": '240GB',
                          "type": 'SSD'
                        }
                      ]
                    ],
                    [
                      'nics',
                      [
                        {
                          "count": 2,
                          "type": '10Gbps'
                        }
                      ]
                    ],
                    [
                      'features',
                      {}
                    ]
                  ],
                  "pricing": {
                    "hour": 0.5
                  }
                }
              }
            ]
          }
        }
      }
    end

    it 'returns collection of projectPlans' do
      is_expected.to match(expected_response)
    end
  end

  # TODO: add sad path
end

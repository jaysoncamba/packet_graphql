describe 'operatingSystems request', type: :request do
  let(:query) do
    <<-GRAPHQL
      query {
        operatingSystems {
          edges{
            node {
              slug
              name
              distro
              version
              provisionableOn
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
          "operatingSystems": {
            "edges": [
              {
                "node": {
                  "slug": 'freebsd_12_testing',
                  "name": 'FreeBSD 12-testing',
                  "distro": 'freebsd',
                  "version": '12-testing',
                  "provisionableOn": [
                    'c1.large.arm',
                    'baremetal_2a',
                    'c1.small.x86',
                    'baremetal_1',
                    'm2.xlarge.x86',
                    's1.large.x86',
                    'baremetal_s',
                    't1.small.x86',
                    'baremetal_0'
                  ]
                }
              },
              {
                "node": {
                  "slug": 'alpine_3',
                  "name": 'Alpine 3',
                  "distro": 'alpine',
                  "version": '3',
                  "provisionableOn": []
                }
              }
            ]
          }
        }
      }
    end

    it 'returns collection of operatingSystems' do
      is_expected.to match(expected_response)
    end
  end

  # TODO: add sad path
end

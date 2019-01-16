shared_context 'logged in headers' do
  let(:token) { FFaker::Internet.slug }
  let(:headers) do
    { 'X-APP-ID' => token }
  end
end

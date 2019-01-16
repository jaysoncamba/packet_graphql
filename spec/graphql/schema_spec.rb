require 'rails_helper'

RSpec.describe 'Schema' do
  let(:working_schema) { PacketGraphqlSchema.to_definition }
  let(:current_schema) do
    File.read(Rails.root.join('app/graphql/schema.graphql'))
  end

  it 'updates schema file for reference with `bundle exec rake dump_schema`' do
    expect(working_schema).to eq current_schema
  end
end

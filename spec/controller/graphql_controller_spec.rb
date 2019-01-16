require 'rails_helper'

describe GraphqlController, type: :controller do
  describe '#execute' do
    let(:query) { 'hello' }
    let(:operation_id) { nil }
    let(:operation_name) { 'operatingSystems' }

    before do
      request.headers['X-APP-ID'] = FFaker::Internet.slug
    end

    subject do
      post :execute, params: { query: query, variables: input_variables, operationName: operation_name }
    end

    shared_examples_for 'graphql' do
      it 'executes schema' do
        expect(PacketGraphqlSchema).to receive(:execute).with(
          query,
          variables: output_variables,
          context: {
            client: a_kind_of(Packet::Client)
          },
          operation_name: operation_name
        )

        subject
      end
    end

    context 'without variables' do
      it_behaves_like 'graphql' do
        let(:input_variables) { nil }
        let(:output_variables) { {} }
      end
    end

    context 'with variables' do
      let(:output_variables) { { 'variable' => 'value' } }

      context 'in string' do
        it_behaves_like 'graphql' do
          let(:input_variables) { output_variables.to_json }
        end
      end

      context 'in hash' do
        it_behaves_like 'graphql' do
          let(:input_variables) { output_variables }
        end
      end

      context 'invalid' do
        let(:input_variables) { 42 }

        it 'raises exception' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end
  end
end

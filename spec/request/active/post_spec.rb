require 'rails_helper'

describe '::Api::V1::ActiveController', type: :request do

  before do
    I18n.default_locale = :en
    post '/api/v1/active', params: params, headers: { 'ACCEPT' => 'application/json' }
  end

  let(:body) { JSON.parse response.body }

  context '#POST' do
    context 'When create a active' do
      context 'When use a valid params' do
        context 'When use a POST url' do
          let(:params) do
            {
              'active': {
                code: 'code',
                description: 'description',
                source: 'source',
                segment: 'segment',
                company_name: 'company_name',
                national_registry: 'national_registry',
                active_type: 1
              }
            }
          end

          it 'must be return status 201' do
            expect(body['status']).to eq 201
          end

          it 'must be return active code' do
            expect(body['data']['code']).to eq 'code'
          end
        end
      end

      context 'When use a invalid params' do
        context 'When use a body without active' do
          let(:params) do
            {
              code: 'code',
              description: 'description',
              source: 'source',
              segment: 'segment',
              company_name: 'company_name',
              national_registry: 'national_registry',
              active_type: 1
            }
          end

          it 'must be return status 400' do
            expect(body['status']).to eq 400
          end
        end

        context 'When use a body without active data' do
          let(:params) { { 'active': {} } }

          it 'must be return status 400' do
            expect(body['status']).to eq 400
          end
        end

        context 'When try send a empty body' do
          let(:params) {}

          it 'must be return status 400' do
            expect(body['status']).to eq 400
          end
        end
      end
    end
  end
end

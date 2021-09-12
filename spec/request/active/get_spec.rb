require 'rails_helper'

describe '::Api::V1::ActiveController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse response.body }

  context '#GET' do
    context 'When showing a specific active' do
      context 'When use a valid id' do
        it 'must be return status 200' do
          active = FactoryBot.create(:active)
          get "/api/v1/active/#{active.id}", headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 200
          expect(body['data']['code']).to eq active.code
        end
      end
    end

    context 'When use a invalid id' do
      context 'When use a body without user' do
        it 'must be return status 404' do
          get '/api/v1/active/1', headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 404
        end
      end
    end
  end
end

require 'rails_helper'

describe '::Api::V1::AssetController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse response.body }

  context '#GET' do
    context 'When showing a specific asset' do
      context 'When use a valid id' do
        it 'must be return status 200' do
          asset = FactoryBot.create(:asset)
          get "/api/v1/asset/#{asset.id}", headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 200
          expect(body['data']['code']).to eq asset.code
        end
      end
    end

    context 'When use a invalid id' do
      context 'When use a body without user' do
        it 'must be return status 404' do
          get '/api/v1/asset/1', headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 404
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::ApiController, type: :request do
  describe 'GET /v1/api' do
    it 'should return articles' do
      get '/api/v1/api'

      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      # expect(json_response['message']).to eq 'Pong'
    end
  end
end

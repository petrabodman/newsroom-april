require 'rails_helper'

RSpec.describe Api::V1::ApiController, type: :request do
  describe 'GET /v1/api' do
    let!(:category) {create(:category, name: 'sports')}
    let!(:user) {create(:user, email: 'journalist@test.com', role: 'journalist', password: '12345678')}
    let!(:article) {create(:article, headline: 'dave', content: 'is mank', user: user, category: category)}
    it 'should return articles' do
      get '/api/v1/api'

      json_response = JSON.parse(response.body)
      expected_response = eval(file_fixture('article.txt').read)
      expect(response.status).to eq 200
      expect(json_response['article']).to eq expected_response.as_json
    end
  end
end

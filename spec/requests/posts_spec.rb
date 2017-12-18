require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  describe 'POST /posts' do
    let(:valid_attributes) { { login: 'Jane Doe',
                               title: 'Test title',
                               content: 'Test content',
                               user_ip: '192.168.0.1' } }

    context 'when the request is valid' do
      before { post posts_path, params: valid_attributes }

      let(:json) { JSON.parse(response.body) }

      it 'creates a post' do
        expect(json['title']).to eq('Test title')
        expect(json['content']).to eq('Test content')
        expect(json['user_ip']).to eq('192.168.0.1')
      end

      it 'returns status code 201' do
        expect(response).to be_success
      end
    end

    context 'when the request is invalid' do
      before { post '/posts' }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /posts/best' do
    before { get best_posts_path, params: { count: '3'} }

    let(:json) { JSON.parse(response.body) }

    it 'returns status code 201' do
      expect(response).to be_success
    end
  end
end
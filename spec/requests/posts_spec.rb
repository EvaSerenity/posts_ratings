require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize test data
  #let!(:todos) { create_list(:todo, 10) }
  #let(:todo_id) { todos.first.id }

  # Test suite for GET /posts
  describe 'POST /posts' do
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/posts', params: valid_attributes }

      it 'creates a post' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /posts/best' do

  end
end
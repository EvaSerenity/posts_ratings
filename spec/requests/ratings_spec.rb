require 'rails_helper'

RSpec.describe 'Ratings API', type: :request do
  let!(:test_post){ create :post }

  describe 'POST /posts/:id/ratings' do

    context 'when the request is valid' do
      before { post post_ratings_path(test_post.id), params: { value: '5.0' } }

      let(:json) { JSON.parse(response.body) }

      it 'returns status code 201' do
        expect(response).to be_success
      end
      it 'returns correct value of average rating for post' do
        expect(json['average_rating']).to eq('5.0')
      end
    end

    context 'when the request is invalid' do
      before { post post_ratings_path(test_post.id)}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

end
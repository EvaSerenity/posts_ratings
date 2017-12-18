require 'rails_helper'

RSpec.describe 'Statistics API', type: :request do
  let!(:test_post){ create :post }

  describe 'GET /statistics/users_with_same_ips' do

    context 'when the request is valid' do
      before { get statistics_users_with_same_ips_path }

      it 'returns status code 201' do
        expect(response).to be_success
      end
    end
  end

end
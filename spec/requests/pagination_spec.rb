# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pagination', type: :request do
  include Response
  describe 'GET /tasks' do
    context 'with valid attributes and user authentication' do
      let(:user) { create(:random_user, :normal) }

      before do
        sign_in user
        create_list(:task, 15, creator: user)
      end

      it 'returns a pagination list of tasks' do
        get '/tasks'
        expect(response).to have_http_status(200)
        expect(json_response.length).to eq(10)
      end

      it 'returns the correct page of tasks' do
        get '/tasks', params: { page: 2 } # Request the second page

        expect(response).to have_http_status(200)
        expect(json_response.length).to eq(5)
      end
    end
  end
end

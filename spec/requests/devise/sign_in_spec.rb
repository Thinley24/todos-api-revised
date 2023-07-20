# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Authentication Sign in', type: :request do
  include Response
  describe 'POST /users/sign_in' do
    context 'with valid credentials' do
      let(:user) { create(:random_user) } # User.create({})
      it 'returns a JSON response with a status of 201 and a success message' do
        # user = User.create(email: 'kinley606@gmail.com', password: 'kinley606')

        post '/users/sign_in', params: { user: { email: user.email, password: user.password } }

        expect(response).to have_http_status(201)
        expect(json_response).to have_key('id')
        expect(json_response['email']).to eq(user.email)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Authentication Sign up', type: :request do
  include Response
  describe 'POST /users' do
    context 'with valid credentials' do
      let(:user_attributes) { attributes_for(:random_user) }
      it 'returns a JSON response with a status of 201 and a success message' do
        post '/users', params: { user: user_attributes }
        expect(response).to have_http_status(201)
        expect(json_response).to have_key('id')
        expect(json_response['email']).to eq(user_attributes[:email])
      end
    end
  end

  describe 'POST /users' do
    context 'with invalid credentials' do
      it 'returns a JSON response with a status of 422 and an error message' do
        post '/users', params: { user: { email: '', password: '' } }
        # binding.pry
        expect(response).to have_http_status(422) # unprocessable entity
        expect(json_response).to have_key('errors')
        # binding.pry
        expect(json_response['errors']).to have_key('email')
        expect(json_response['errors']['email']).to include("can't be blank")
        expect(json_response['errors']['password']).to include("can't be blank")
      end
    end
  end
end

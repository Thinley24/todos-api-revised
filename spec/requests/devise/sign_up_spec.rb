# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Authentication Sign up', type: :request do
  include Response
  describe 'POST /users' do
    context 'with valid credentials' do
      let(:user_params) do
        {
          user: {
            email: Faker::Internet.email,
            password: Faker::Internet.password,
            role_id: Role.find_by(name: 'User').id
          }
        }
      end
      it 'returns a JSON response with a status of 201 and a success message' do
        post '/users', params: user_params
        expect(response).to have_http_status(201)
        expect(json_response).to have_key('id')
        expect(json_response['email']).to eq(user_params[:user][:email])
        expect(json_response['role_id']).to eq(user_params[:user][:role_id])
      end
    end

    context 'with invalid credentials' do
      it 'returns a JSON response with a status of 422 and an error message' do
        post '/users', params: { user: { email: '', password: '' } }
        expect(response).to have_http_status(422) # unprocessable entity
        expect(json_response).to have_key('errors')
        expect(json_response['errors']).to include("Email can't be blank")
        expect(json_response['errors']).to include("Password can't be blank")
      end
    end
  end
end

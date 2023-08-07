# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Authentication Sign in', type: :request do
  include Response
  describe 'POST /users/sign_in' do
    context 'with valid credentials for a normal user' do
      let!(:normal_user) { create(:random_user, :normal) }
      let!(:params) do
        {
          user: {
            email: normal_user.email,
            password: normal_user.password
          }
        }
      end
      it 'returns a JSON response with a status of 201 and a success message' do
        post '/users/sign_in', params: params
        expect(response).to have_http_status(201)
        expect(json_response).to have_key('id')
        expect(json_response['email']).to eq(normal_user.email)
      end
    end

    context 'with valid credentials for an admin user' do
      let!(:admin_user) { create(:random_user, :admin) }
      let!(:params) do
        {
          user: {
            email: admin_user.email,
            password: admin_user.password
          }
        }
      end
      it 'returns a JSON response with a status of 201 and a success message' do
        post '/users/sign_in', params: params
        expect(response).to have_http_status(201)
        expect(json_response).to have_key('id')
        expect(json_response['email']).to eq(admin_user.email)
      end
    end
  end

  describe 'POST /users/sign_in' do
    context 'with invalid credentials' do
      let!(:params) do
        {
          user: {
            email: 'invalid@example.com',
            password: 'wrong_password'
          }
        }
      end
      it 'returns a JSON response with a status of 401 and an error message' do
        post '/users/sign_in', params: params
        expect(response).to have_http_status(401)
        expect(json_response).to have_key('error')
        expect(json_response['error']).to eq('Invalid Email or password.')
      end
    end
  end
end

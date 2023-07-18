require 'rails_helper'

RSpec.describe 'User Authentication', type: :request do
  describe 'GET /users/sign_in' do
    context 'with valid credentials' do
      it 'returns a status of 200 and a success message' do
        user = User.create(email: 'kinley606@gmail.com', password: 'kinley606')

        post '/users/sign_in', params: { user: { email: user.email, password: 'kinley606' } }
        binding.pry

        expect(response).to have_http_status(200)
        expect(response.body).to include('Signed in successfully')
      end
    end

    context 'with invalid credentials' do
      it 'returns a status of 401 and an error message' do
        user = User.create(email: 'kinley606@mgail.com', encrypted_password: 'kinley606')

        get '/users/sign_in', params: { user: { email: user.email, encrypted_password: 'kinley606' } }

        expect(response).to have_http_status(401)
        expect(response.body).to include('Invalid email or password')
      end
    end
  end

  describe 'DELETE /users' do
    context 'when authenticated' do
      it 'returns a status of 200 and a success message' do
        user = User.create(email: 'kinley606@gmail.com', encrypted_password: 'kinley606')

        sign_in user

        delete '/users'

        expect(response).to have_http_status(200)
        expect(response.body).to include('Signed out successfully')
      end
    end

    context 'when not authenticated' do
      it 'returns a status of 401 and an error message' do
        delete '/users'

        expect(response).to have_http_status(401)
        expect(response.body).to include('You need to sign in or sign up before continuing')
      end
    end
  end
end






# require 'rails_helper'
#
# RSpec.describe 'User Authentication', type: :request do
#     it 'Returns a status of 200' do
#       get '/users/sign_in'
#       expect(response).to have_http_status(200)
#     end
#
#     it 'Returns a status of 200 if successfully signed in' do
#       get '/users/sign_up'
#       expect(response).to have_http_status(:success)
#     end
# end
# require 'rails_helper'
# RSpec.describe 'User Password Update', type: :request do
#   include Response
#   describe 'PUT /users/password' do
#     context 'with valid email' do
#       it 'sends a password reset email and returns a JSON response with a status of 200' do
#         put '/users/password', params: { user: { reset_password_token: user.reset_password_token, password: 'kingaul@606' } }
#         expect(response).to have_http_status(200)
#         expect(json_response)
#       end
#     end
#   end
# end

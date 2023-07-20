require 'rails_helper'

# RSpec.describe 'User Authentication', type: :request do
#   include Response
#   describe 'POST /users/sign_in' do
#     context 'with valid credentials' do
#       it 'returns a JSON response with a status of 201 and a success message' do
#         user = User.create(email: 'kinley606@gmail.com', password: 'kinley606')
#
#         post '/users/sign_in', params: { user: { email: user.email, password: 'kinley606' } }
#
#         expect(response).to have_http_status(201)
#         # expect(response.body).to include('Signed in successfully')
#         # expect(JSON.parse(response.body))
#         expect(json_response)
#       end
#     end
#   end
# end

RSpec.describe 'User Authentication Sign in', type: :request do
  include Response
  describe 'POST /users/sign_in' do
    context 'with valid credentials' do
      let(:user) { create(:random_user) } # User.create({})
      it 'returns a JSON response with a status of 201 and a success message' do
        # user = User.create(email: 'kinley606@gmail.com', password: 'kinley606')

        post '/users/sign_in', params: { user: { email: user.email, password: user.password} }

        expect(response).to have_http_status(201)
        # expect(response.body).to include('Signed in successfully')
        # expect(JSON.parse(response.body))
        expect(json_response)
      end
    end
  end
end


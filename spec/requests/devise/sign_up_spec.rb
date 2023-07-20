require 'rails_helper'

# RSpec.describe 'User Authentication Sign up', type: :request do
#   include Response
#   describe 'POST /users' do
#     context 'with valid credentials' do
#       it 'returns a JSON response with a status of 201 and a success message' do
#         user_attributes = { email: 'tashi508@gmail.com', password: 'tashi508' }
#         post '/users', params: { user: user_attributes }
#         expect(response).to have_http_status(201)
#         expect(json_response)
#       end
#     end
#   end
# end

RSpec.describe 'User Authentication Sign up', type: :request do
  include Response
  describe 'POST /users' do
    context 'with valid credentials' do
      let(:user_attributes) { attributes_for(:random_user) }
      it 'returns a JSON response with a status of 201 and a success message' do
        post '/users', params: { user: user_attributes }
        expect(response).to have_http_status(201)
        binding.pry
        expect(json_response)
      end
    end
  end
end
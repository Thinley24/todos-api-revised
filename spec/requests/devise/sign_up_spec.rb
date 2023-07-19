require 'rails_helper'

RSpec.describe 'User Authentication Sign up', type: :request do
  include Response
  describe 'POST /users' do
    context 'with valid credentials' do
      it 'returns a JSON response with a status of 201 and a success message' do
        user_attributes = { email: 'kinley606@gmail.com', password: 'kinley606' }

        post '/users', params: { user: user_attributes }
        
        expect(response).to have_http_status(201)
        expect(json_response)
      end
    end
  end
end
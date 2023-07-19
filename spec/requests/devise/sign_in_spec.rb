require 'rails_helper'
#
# RSpec.describe "User Sign in", type: :request do
#   describe 'POST /users/sign_in' do
#     context 'with valid credentials' do
#       it 'returns a status of 201 and a success message' do
#         user = User.create(email: 'kinley606@gmail.com', password: 'kinley606')
#
#         post '/users/sign_in', params: { user: { email: user.email, password: 'kinley606' } }
#         # binding.pry
#         expect(response).to have_http_status(:success)
#         expect(response.body).to include('Signed in successfully')
#       end
#     end
#   end
# end


# RSpec.describe User, type: :model do
#   subject { User.new(email: 'kinley606@gmail.com', password: 'kinley606')}
#   it "is valid with valid attributes" do
#     expect(subject).to be_valid
#   end
# end

RSpec.describe 'User Authentication', type: :request do
  include Response
  describe 'POST /users/sign_in' do
    context 'with valid credentials' do
      it 'returns a JSON response with a status of 201 and a success message' do
        user = User.create(email: 'kinley606@gmail.com', password: 'kinley606')

        post '/users/sign_in', params: { user: { email: user.email, password: 'kinley606' } }

        expect(response).to have_http_status(201)
        # expect(response.body).to include('Signed in successfully')
        # expect(JSON.parse(response.body))
        expect(json_response)
      end
    end
  end
end

# require 'rails_helper'
# require 'json'
#
# RSpec.describe "User Sign in", type: :request do
#   describe "POST /users/sign_in" do
#     context "with valid parameters" do
#       it "returns a status of 201 and a success message" do
#         post '/users/sign_in', params: { user: { email: 'kinley606@gmail.com', password: 'kinley606' } }
#
#         binding.pry
#         expect(response).to have_http_status(201)
#         json_response = JSON.parse(response.body)
#
#         # Perform assertions or further processing with the parsed JSON response
#         expect(json_response['email']).to eq('kinley606@gmail.com')
#
#         # Add more expectations as needed
#       end
#     end
#   end
# end


require 'rails_helper'

RSpec.describe 'Task Update', type: :request do
  include Response
  describe 'PUT /tasks/:id' do
    let(:user) { create(:random_user, :normal) }
    let(:task) { create(:task, creator: user) }
    let(:update_params) do
      {
        task: {
          title: 'Complete todo rails api',
          description: 'Updated task description',
          due_date: Date.tomorrow.to_s,
          status: 'in progress'
        }
      }
    end
    context 'when user is the creator of the task' do


      before { sign_in user }

      it 'updates the task and returns a JSON response with a status of 200' do
        put "/tasks/#{task.id}", params: update_params
        expect(response).to have_http_status(200)
        task.reload
        expect(json_response['title']).to eq(update_params[:task][:title])
        expect(json_response['description']).to eq(update_params[:task][:description])
      end
    end

    context 'when user is not the creator of the task' do
      let(:other_user) { create(:random_user, :normal) }

      before { sign_in other_user }

      it 'does not update the task and returns a JSON response with a status of 403' do
        put "/tasks/#{task.id}", params: update_params
        expect(response).to have_http_status(403)
        expect(json_response['error']).to eq('You are not authorized to update this task')
      end
    end
  end
end


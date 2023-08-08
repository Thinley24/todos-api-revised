# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  include Response
  describe 'POST /tasks' do
    context 'with valid user authentication and authorization' do
      let(:user) { create(:random_user, :admin) }
      before { sign_in user }

      let(:parent_task) { create(:task, creator: user) }

      let(:subtask_params) do
        {
          task: {
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph,
            due_date: Faker::Date.forward(days: 7),
            status: 'pending',
            creator_id: user.id,
            assignee_id: create(:random_user, :normal).id,
            parent_task_id: parent_task.id # Set the parent task ID
          }
        }
      end

      it 'creates a subtask and associates it with the parent task' do
        post '/tasks', params: subtask_params
        expect(response).to have_http_status(201)
        expect(json_response['title']).to eq(subtask_params[:task][:title])
        expect(json_response['parent_task_id']).to eq(parent_task.id)
      end
    end
  end
end

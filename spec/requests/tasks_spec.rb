# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  include Response
  describe 'POST /tasks' do
    context 'with valid attributes but without authentication' do
      let(:task_params) do
        {
          task: {
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph,
            due_date: Faker::Date.forward(days: 7),
            status: 'pending'
          }
        }
      end
      it 'returns a JSON response with a status 302 and redirect message' do
        post '/tasks', params: task_params
        expect(response).to have_http_status(302)
      end
    end

    context 'with valid attributes and user authentication' do
      let(:user) { create(:random_user, :normal) }
      before { sign_in user }
      let(:task_params) do
        {
          task: {
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph,
            due_date: Faker::Date.forward(days: 7),
            status: 'pending',
            creator_id: user.id
          }
        }
      end
      it 'returns a JSON response with a status 201 and a success message' do
        post '/tasks', params: task_params

        expect(response).to have_http_status(201)
        expect(json_response['title']).to eq(task_params[:task][:title])
        expect(json_response['creator_id']).to eq(task_params[:task][:creator_id])
        expect(json_response['assignee_id']).to eq(task_params[:task][:assignee_id])
      end
    end

    context 'with valid attributes and admin authentication' do
      let(:user) { create(:random_user, :admin) }
      before { sign_in user }
      let(:task_params) do
        {
          task: {
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph,
            due_date: Faker::Date.forward(days: 7),
            status: 'pending',
            creator_id: user.id,
            assignee_id: create(:random_user, :normal).id
          }
        }
      end
      it 'returns a JSON response with a status 201 and a success message' do
        post '/tasks', params: task_params
        expect(response).to have_http_status(201)
        expect(json_response['title']).to eq(task_params[:task][:title])
        expect(json_response['creator_id']).to eq(task_params[:task][:creator_id])
        expect(json_response['assignee_id']).to eq(task_params[:task][:assignee_id])
      end
    end

    context 'with valid attributes and admin authentication' do
      let(:user) { create(:random_user, :admin) }
      before { sign_in user }
      let(:task_params) do
        {
          task: {
            title: Faker::Lorem.sentence,
            description: Faker::Lorem.paragraph,
            due_date: Faker::Date.forward(days: 7),
            status: 'pending',
            creator_id: user.id
          }
        }
      end
      it 'returns a JSON response with a status 201 and a success message' do
        post '/tasks', params: task_params
        expect(response).to have_http_status(201)
        # binding.pry
        expect(json_response['title']).to eq(task_params[:task][:title])
        expect(json_response['creator_id']).to eq(task_params[:task][:creator_id])
        expect(json_response['assignee_id']).to eq(task_params[:task][:assignee_id])
        expect(json_response['assignee_id']).to eq(task_params[:task][:assignee_id])
      end
    end
  end
end

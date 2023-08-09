# frozen_string_literal: true

require 'rails_helper'
require 'pundit/rspec'

RSpec.describe TaskPolicy do
  subject { described_class }

  let(:user) { create(:random_user, :normal) }
  let(:task_params) { create(:task, creator: user) }

  permissions :index?, :show? do
    it 'grants access to any user' do
      expect(subject).to permit(user)
    end
  end

  permissions :create?, :update?, :destroy? do
    context 'when user is the creator of the task' do
      it 'grants access' do
        expect(subject).to permit(user, task_params)
        expect(user.email).to eq(task_params.creator.email)
      end
    end
  end

  permissions :update?, :destroy? do
    context 'when user is not the creator of the task' do
      let(:other_user) { create(:random_user, :normal) }
      it 'does not grant access' do
        expect(subject).not_to permit(other_user, task_params)
        expect(other_user.email).not_to eq(task_params.creator.email)
      end
    end
  end
end

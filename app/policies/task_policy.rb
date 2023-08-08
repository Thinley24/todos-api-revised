# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    raise Pundit::NotAuthorizedError, 'You are not authorized to update this task' unless user == record.creator

    true
  end

  def destroy?
    user == record.creator
  end

  def create_subtask?
    user == record.creator
  end

  def destroy_subtask?
    user == record.creator
  end
end

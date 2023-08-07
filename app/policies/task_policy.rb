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
    user == record.creator
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

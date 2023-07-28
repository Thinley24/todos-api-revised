# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true

  validates_presence_of :title, :description, :due_date, :status
end

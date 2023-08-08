# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id', optional: true

  belongs_to :parent_task, class_name: 'Task', optional: true
  has_many :subtasks, class_name: 'Task', foreign_key: 'parent_task_id', dependent: :destroy
  accepts_nested_attributes_for :subtasks, allow_destroy: true

  validates_presence_of :title, :description, :due_date, :status
end

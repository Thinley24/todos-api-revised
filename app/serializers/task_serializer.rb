# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :status, :creator_id, :assignee_id, :subtasks

  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'

  belongs_to :parent_task, class_name: 'Task', optional: true
  has_many :subtasks, class_name: 'Task', key: 'subtasks', foreign_key: 'parent_task_id'
end

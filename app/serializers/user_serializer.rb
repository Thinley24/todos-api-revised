class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_many :created_tasks, class_name: 'Task', foreign_key: 'creator_id'
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'
end

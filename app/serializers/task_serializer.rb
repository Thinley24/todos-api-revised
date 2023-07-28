class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :status, :creator_id, :assignee_id

  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
end

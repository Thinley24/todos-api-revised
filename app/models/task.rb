class Task < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates :title, :description, :due_date, :status, presence: true
end

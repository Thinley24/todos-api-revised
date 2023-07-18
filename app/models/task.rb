class Task < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates :title, :description, :die_date, :status, presence: true
end

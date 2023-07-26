# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates_presence_of :title, :description, :due_date, :status
end

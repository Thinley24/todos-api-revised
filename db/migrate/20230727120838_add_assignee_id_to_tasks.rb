# frozen_string_literal: true

class AddAssigneeIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :assignee_id, :integer
  end
end

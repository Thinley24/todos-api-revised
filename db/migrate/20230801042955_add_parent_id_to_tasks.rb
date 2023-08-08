# frozen_string_literal: true

class AddParentIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :parent_task_id, :integer
  end
end

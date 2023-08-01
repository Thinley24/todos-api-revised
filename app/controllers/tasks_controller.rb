# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @task = current_user.tasks
  #   json_response(@task)
  # end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created, include: ['subtasks']
    else
      render json: { errors: @task.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :due_date,
      :status,
      :creator_id,
      :assignee_id,
      subtasks_attributes: %i[title description due_date status creator_id assignee_id]
    )
  end
end

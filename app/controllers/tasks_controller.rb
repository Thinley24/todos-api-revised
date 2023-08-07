# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    # @task = current_user.tasks
    @pagy, @tasks = pagy(load_tasks)
    render json: { tasks: @tasks, meta: @pagy }
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      created_response(@task)
    else
      error_response(@task.errors.full_messages)
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

  def load_tasks
    Task.includes(:creator, :assignee, :parent_task, :subtasks).all
  end

  def created_response(task)
    render json: task, status: :created, include: ['subtasks']
  end

  def error_response(errors, status = :unprocessable_entity)
    render json: { errors: errors.join(', ') }, status: status
  end
end

# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_task, only: %i[show update destroy]

  def index
    @pagy, @tasks = pagy(Task.includes(:creator, :assignee, :parent_task, :subtasks).all)
    render json: @tasks
  end

  def show
    authorize @task
    render json: @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    if @task.save
      render json: @task, status: :created, include: ['subtasks']
    else
      render json: { errors: @task.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def update
    authorize @task
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @task
    @task.destroy
    head :no_content
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

  def set_task
    @task = Task.find(params[:id])
  end
end

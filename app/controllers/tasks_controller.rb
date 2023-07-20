# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    render json: @user
  end
end

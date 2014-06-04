class TasksController < ApplicationController
  before_action :set_project, only: [:index]
  before_action :set_task, only: [:show,:edit, :update, :destroy]

  def index

  end

  def show

  end

  def edit

  end

  def new

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    set_project
    @task = @project.tasks.find(params[:id])
  end

end
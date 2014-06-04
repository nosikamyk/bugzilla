class StoriesController < ApplicationController
  before_action :set_project, only: [:index, :new]
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def edit

  end

  def new
    @story = @project.stories.new
  end

  def create
    @story = @project.stories.new(project_params)
    if @story.save
      redirect_to project_path(@project), notice: "added story: #{@story.name}"
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_story
    set_project
    @story = @project.stories.find(params[:id])
  end


end
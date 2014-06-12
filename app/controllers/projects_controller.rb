class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.all.page(params[:page]).per(8)
  end

  def show
  end

  def edit
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.set_owner(current_user)
      redirect_to projects_path, notice: "added project: #{@project.name}"
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to edit_project_path(@project), notice: "Updated project: #{@project.name}"
    else
      redirect_to edit_project_path(@project), alert: "Error"
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project deleted."
    else
      redirect_to projects_path, alert: "Deleting failure."
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
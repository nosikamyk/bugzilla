class ProjectsController < ApplicationController

before_action :set_project, only: [:show,:edit, :update, :destroy, :add_member]
before_action :set_users, only: [:add_member]

  def index
    @projects = current_user.projects.all.page(params[:page]).per(8)
  end

  def show

  end

  def edit

  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.users = [current_user]
    if @project.save
      redirect_to projects_path, notice: "added project: #{@project.name}"
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to edit_project_path(@project), notice: "updated project: #{@project.name}"
    else
      redirect_to edit_project_path(@project), alert: "Error"
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "project deleted"
    else
      redirect_to projects_path, alert: "deleting failure"
    end
  end

  def add_member


  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_users
    @users = User.all
  end

end
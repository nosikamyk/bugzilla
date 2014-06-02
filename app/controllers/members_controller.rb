class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def edit

  end

  def new
    @member = @project.members.new
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

  end

  def destroy

  end

  private


  def set_member
    set_project
    @member = @project.members.find(:user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
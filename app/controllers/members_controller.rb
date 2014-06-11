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
    @member = @project.members.build(member_params)
    if @member.save
      redirect_to edit_project_path(@project), notice: "added member: #{@member.member_name}"
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  private

  def member_params
    params.require(:member).permit(:member_name, :member_email, :manager)
  end


  def set_member
    @member = @project.members.find(:id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
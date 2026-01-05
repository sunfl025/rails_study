class Admin::ProjectsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_project, only: %i[ show edit update destroy ]

  layout "admin"

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path, notice: "Project created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
       Rails.logger.debug "UPDATE OK"
      redirect_to admin_projects_path, notice: "Project updated successfully"
    else
       Rails.logger.debug @project.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, notice: "Project deleted"
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :user_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end

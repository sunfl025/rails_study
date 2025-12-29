class ProjectsController < ApplicationController
  before_action :set_project , only: %i[ show edit update destroy]
  def index
    @projects = Project.all
  end
  def show
    @project = Project.find(params[:id])
  end
   def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path 
  end

   private
    def project_params
      params.require(:project).permit( :name, :description, :user_id)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end

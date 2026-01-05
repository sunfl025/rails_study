class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
     @projects = current_user.projects
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

   def new
  end

  def create
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @project.update(project_params)
  #     redirect_to @project
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @project.destroy
  #   redirect_to projects_path 
  # end

   private
    def project_params
      params.require(:project).permit( :name, :description, :user_id)
    end

end

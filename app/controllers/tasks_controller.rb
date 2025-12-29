class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
    
    def index
    @tasks = Task.all

        if params[:name].present?
            @tasks = @tasks.joins(:project)
                    .where(
                    "tasks.name LIKE :name OR tasks.description LIKE :name OR projects.name LIKE :name",
                    name: "%#{params[:name]}%"
                )
        end

        if params[:created_at].present?
            date = Time.zone.parse(params[:created_at])
            @tasks = @tasks.where(created_at: date.beginning_of_day..date.end_of_day)
        end
    end

    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
    @task = Task.new(task_params)

    if @task.save
        redirect_to tasks_path
    else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
    end

    
    def edit
    end
    
    def update
        if @task.update(task_params)
        redirect_to tasks_path
        else
        render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @task.destroy
        redirect_to tasks_path, notice: "Task deleted successfully"
    end

    def by_user
    @tasks = Task.where(user_id: params[:user_id])
    render json: @tasks
    end

    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit( :name, :description, :position, :completed, :project_id)
    end
end

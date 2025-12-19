class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]
    
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        if @task.save
        redirect_to tasks_path, notice: "Task created successfully"
        else
        render :new, status: :unprocessable_entity
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
        params.require(:task).permit(:title, :description, :user_id)
    end
end

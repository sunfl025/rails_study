class Admin::TasksController < ApplicationController
   before_action :authenticate_admin!
    layout "admin"

    def index
      @tasks = Task.all
    end
end

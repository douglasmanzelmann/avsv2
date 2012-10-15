class TasksController < ApplicationController

  def index

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show

  end

  def update
  end

  def destroy 
  end
  
end

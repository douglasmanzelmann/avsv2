class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      flash[:success] = "Task saved"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      flash[:success] = "Task updated"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy 
  end
  
end

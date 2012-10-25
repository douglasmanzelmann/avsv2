class StaticPagesController < ApplicationController

  def home
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @tasks = Task.for_day(@date).all
    @task = Task.new
  end
  
end

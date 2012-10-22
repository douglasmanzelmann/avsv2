class StaticPagesController < ApplicationController

  def home
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @tasks = Task.all
  end
  
end

class StaticPagesController < ApplicationController

  def home
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
  
end

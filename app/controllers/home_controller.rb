class HomeController < ApplicationController

  def index
    @prof_list = Prof.order(like: :desc).all
  end
  
  def like
    puts params[:prof_id]
    redirect_to :back
  end
end

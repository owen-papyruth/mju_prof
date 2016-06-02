class HomeController < ApplicationController

  def index
    @prof_list = Prof.order(like: :desc).all
  end
  
  def like
    Prof.where('id like :key', key:params[:prof_id]).update_all("like = like + 1")
    redirect_to :back
  end
  
  def search_data
    data = params[:keyword]
    prof =  Prof.where('name like :keyword OR dept like :keyword', keyword:"%" + data +"%")
    @prof_list = prof.order(like: :desc).all
    puts @prof_list.size
  end
end

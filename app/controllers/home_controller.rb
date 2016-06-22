class HomeController < ApplicationController

  def index
    @prof_list = Prof.order(like: :desc).all
  end

  def like
    # Prof.where('id = ?', params[:prof_id]).update_all("like = like + 1")
    p = Prof.find(params[:prof_id])
    if p != nil
      p.like = p.like + 1
      p.save
    end
    redirect_to :back
  end

  def search_data
    data = params[:keyword]
    prof =  Prof.where('name like :keyword OR dept like :keyword', keyword:"%" + data +"%")
    @prof_list = prof.order(like: :desc).all
    render 'index'
    # puts @prof_list.size
  end
end

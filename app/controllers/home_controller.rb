class HomeController < ApplicationController

  def index
    @prof_list = Prof.all
  end
end

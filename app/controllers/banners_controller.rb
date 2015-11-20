class BannersController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @banners = Item::Banner.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @banner = Item::Banner.find(params[:id])
  end
end
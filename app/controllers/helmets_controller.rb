class HelmetsController < ApplicationController
  def index
    @helmets = Item::Helmet.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @helmet = Item::Helmet.find(params[:id])
  end
end
class AmuletsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @amulets = Item::Amulet.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @amulet = Item::Amulet.find(params[:id])
  end
end
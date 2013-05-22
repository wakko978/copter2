class AmuletsController < ApplicationController
  def index
    @amulets = Item::Amulet.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @amulet = Item::Amulet.find(params[:id])
  end
end
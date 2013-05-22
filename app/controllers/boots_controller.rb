class BootsController < ApplicationController
  def index
    @boots = Item::Boot.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @boot = Item::Boot.find(params[:id])
  end
end
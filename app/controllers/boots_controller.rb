class BootsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @boots = Item::Boot.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @boot = Item::Boot.find(params[:id])
  end
end
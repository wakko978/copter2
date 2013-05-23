class LandsController < ApplicationController
  def index
    @lands = Land.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @land = Land.find(params[:id])
  end
end
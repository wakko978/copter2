class PowersController < ApplicationController
  def index
    @powers = Power.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @power = Power.find(params[:id])
  end
end
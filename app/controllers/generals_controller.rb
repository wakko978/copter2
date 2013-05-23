class GeneralsController < ApplicationController
  def index
    @generals = General.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @general = General.find(params[:id])
  end
end
class GeneralsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @generals = General.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @general = General.find(params[:id])
  end
end
class MonstersController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @monsters = Monster.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @monster = Monster.find(params[:id])
  end
end
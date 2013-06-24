class SoldiersController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @soldiers = Soldier.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @soldier = Soldier.find(params[:id])
  end
end
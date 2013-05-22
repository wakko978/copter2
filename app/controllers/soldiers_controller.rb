class SoldiersController < ApplicationController
  def index
    @soldiers = Soldier.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @soldier = Soldier.find(params[:id])
  end
end
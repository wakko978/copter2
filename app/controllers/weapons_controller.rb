class WeaponsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @weapons = Weapon.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @weapon = Weapon.find(params[:id])
  end
end
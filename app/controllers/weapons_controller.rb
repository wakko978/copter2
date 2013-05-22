class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @weapon = Weapon.find(params[:id])
  end
end
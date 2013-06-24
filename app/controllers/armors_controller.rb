class ArmorsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @armors = Item::Armor.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @armor = Item::Armor.find(params[:id])
  end
end
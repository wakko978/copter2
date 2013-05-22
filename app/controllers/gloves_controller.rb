class GlovesController < ApplicationController
  def index
    @gloves = Item::Glove.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @glove = Item::Glove.find(params[:id])
  end
end
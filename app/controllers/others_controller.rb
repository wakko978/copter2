class OthersController < ApplicationController
  def index
    @others = Other.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @other = Other.find(params[:id])
  end
end
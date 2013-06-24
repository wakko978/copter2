class OthersController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @others = Other.search(:c => params[:c], :d => params[:d], :page => params[:page])
  end

  def show
    @other = Other.find(params[:id])
  end
end
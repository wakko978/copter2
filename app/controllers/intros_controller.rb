class IntrosController < ApplicationController
  def index
    @message = Message.first
  end
  
  def catcher
    flash[:warning] = "Seems that the page you were looking for does not exist, so you've been redirected here."
    redirect_to :action => 'index'
  end
end

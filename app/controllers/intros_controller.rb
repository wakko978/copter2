class IntrosController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @message = Message.first
    
    respond_to do |format|
      format.html
    end
  end
  
  def catcher
    flash[:warning] = "Seems that the page you were looking for does not exist, so you've been redirected here."
    redirect_to :action => 'index'
  end
end

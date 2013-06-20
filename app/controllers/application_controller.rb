class ApplicationController < ActionController::Base
  protect_from_forgery   
  
  after_filter :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:alert] = 'The object you tried to access does not exist'
    # render :not_found   # or e.g. redirect_to :action => :index
    redirect_to root_path
  end
  
  rescue_from ActionController::RoutingError do
    flash[:alert] = 'The page you tried to access does not exist'
    # render :not_found   # or e.g. redirect_to :action => :index
    redirect_to root_path
  end
end

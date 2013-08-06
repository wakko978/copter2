class PropertiesController < ApplicationController
  before_filter :load_profile
  
  def index
    @properties = @profile.properties.joins(:land)

    respond_to do |format|
      format.json {
        json = {}
        @profile.properties.includes(:land).each do |r|
          json[r.land.name] = r.owned.to_s
        end
        render json: json
      }
    end
  end
  
  def update_all
    to_update = params['to_update']
    @results = Hash.new
    @result = @profile.update_lands('land' => to_update)
    
    respond_to do |format|
      format.html { render partial: 'profiles/changes' }
    end
  end
  
  def update
    @property = @profile.properties.find(params[:id])
    
    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { render :partial => 'profiles/properties' }
      end
    end
  end
  
  protected
    def load_profile
      @profile = current_user.profiles.find(params[:profile_id])
    end
end
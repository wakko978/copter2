class PropertiesController < ApplicationController
  before_filter :load_profile
  
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
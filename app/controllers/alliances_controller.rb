class AlliancesController < ApplicationController
  before_filter :load_profile
  
  def index
    @alliances = @profile.alliances.scoped

    respond_to do |format|
      format.html
    end
  end
  
  def new
    @alliance = Alliance.new
    
    @collection = @profile.recruits.includes(:general).order("generals.name")
  end
  
  def edit
    @alliance = @profile.alliances.find(params[:id])
    
    @collection = @profile.recruits.includes(:general).order("generals.name")
  end
  
  def create
    @alliance = @profile.alliances.new(params[:alliance])
    @alliance.alliance_type = 'any'
    
    @collection = @profile.recruits.includes(:general).order("generals.name")
    
    respond_to do |format|
      if params[:alliance][:primary_link] == params[:alliance][:secondary_link] || params[:alliance][:primary_link] == params[:alliance][:tertiary_link] || params[:alliance][:secondary_link] == params[:alliance][:tertiary_link]
        flash[:alert] = "A general cannot be a link to itself."
        format.html { render :action => 'new' }
      elsif @alliance.save
        format.html { redirect_to profile_alliances_path(@profile) }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update
    @alliance = @profile.alliances.find(params[:id])
    
    @collection = @profile.recruits.includes(:general).order("generals.name")
    
    respond_to do |format|
      if params[:alliance][:primary_link] == params[:alliance][:secondary_link] || params[:alliance][:primary_link] == params[:alliance][:tertiary_link] || params[:alliance][:secondary_link] == params[:alliance][:tertiary_link]
        flash[:alert] = "A general cannot be a link to itself."
        format.html { render :action => 'edit' }
      elsif @alliance.update_attributes(params[:alliance])
        format.html { redirect_to profile_alliances_path(@profile) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end
  
  def destroy
    @alliance = @profile.alliances.find(params[:id])
    
    @alliance.destroy

    respond_to do |format|
      format.html { redirect_to(profile_alliances_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      @profile = current_user.profiles.includes(:recruits,:generals).find(params[:profile_id])
    end
end
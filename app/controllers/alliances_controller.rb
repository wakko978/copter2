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
    @alliance_type = params[:alliance_type] || 'piercing'
    
    @collection = @profile.recruits.includes(:general).where("generals.alliance_type = ?",@alliance_type)
  end
  
  def edit
    @alliance = @profile.alliances.find(params[:id])
    
    @collection = @profile.recruits.includes(:general).where("generals.alliance_type = ?",@alliance.alliance_type)
  end
  
  def create
    @alliance = @profile.alliances.new(params[:alliance])
    @alliance_type = params[:alliance][:alliance_type] || 'piercing'
    
    @collection = @profile.recruits.includes(:general).where("generals.alliance_type = ?",@alliance_type)
    
    respond_to do |format|
      if @alliance.save
        format.html { redirect_to profile_alliances_path(@profile) }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update
    @alliance = @profile.alliances.find(params[:id])
    
    @collection = @profile.recruits.includes(:general).where("generals.alliance_type = ?",@alliance.alliance_type)
    
    respond_to do |format|
      if @alliance.update_attributes(params[:alliance])
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
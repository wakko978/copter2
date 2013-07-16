class ArmsController < ApplicationController
  before_filter :load_profile
  
  def index
    @arms = @profile.arms.joins(:weapon).scoped
    if params[:filters]
      filters = params[:filters]
      if filters[:term]
        @arms = @arms.where(
          "UPPER(weapons.name) LIKE ?","%#{filters[:term].upcase}%"
        )
      end
    end

    @arms = @arms.order(
      ((params[:c].nil?) ? "weapons.e_attack" : params[:c]) + " " +
      ((params[:d] == 'up') ? "ASC" : "DESC")
    ).paginate(:page => params[:page])

    respond_to do |format|
      format.html
    end
  end
  
  def get_info
    @weapon = Weapon.find(params[:weapon][:id])
    
    respond_to do |format|
      format.json { render json: { piercing: "Base: #{@weapon.piercing}", resistance: "Base: #{@weapon.resistance}" } }
    end
  end
  
  def new
    @arm = Arm.new
    @weapons = Weapon.order(:name) - @profile.weapons
  end
  
  def create
    @arm = @profile.arms.build(params[:arm])
    @weapons = Weapon.order(:name) - @profile.weapons
    
    respond_to do |format|
      if @arm.save
        format.html { redirect_to profile_arms_path(@profile) }
      else
        format.html { render :action => 'new'}
      end
    end
  end
  
  def update
    @arm = @profile.arms.find(params[:id])
    
    respond_to do |format|
      if @arm.update_attributes(params[:arm])
        format.json { render json: @arm }
      else
        format.json { render json: {errors: @arm.errors.full_messages}, status: 422 }
      end
    end
  end
  
  def destroy
    @arm = @profile.arms.find(params[:id])
    
    @arm.destroy

    respond_to do |format|
      format.html { redirect_to(profile_arms_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      @profile = current_user.profiles.find(params[:profile_id])
    end
end
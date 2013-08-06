class FightersController < ApplicationController
  before_filter :load_profile
  
  def index
    @fighters = @profile.fighters.joins(:soldier).scoped
    if params[:filters]
      filters = params[:filters]
      if filters[:term]
        @fighters = @fighters.where(
          "UPPER(soldiers.name) LIKE ?","%#{filters[:term].upcase}%"
        )
      end
    end

    @fighters = @fighters.order(
      ((params[:c].nil?) ? "soldiers.e_attack" : params[:c]) + " " +
      ((params[:d] == 'up') ? "ASC" : "DESC")
    ).paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.json {
        json = {}
        @profile.fighters.includes(:soldier).each do |r|
          json[r.soldier.name] = [r.owned.to_s, r.soldier.attack.to_s, r.soldier.defense.to_s]
        end
        render json: json
      }
    end
  end
  
  def new
    @fighter = Fighter.new
    @soldiers = Soldier.order(:name) - @profile.soldiers
  end
  
  def create
    @fighter = @profile.fighters.build(params[:fighter])
    @soldiers = Soldier.order(:name) - @profile.soldiers
    
    respond_to do |format|
      if @fighter.save
        format.html { redirect_to profile_fighters_path(@profile) }
      else
        format.html { render :action => 'new' }
      end
    end
  end
  
  def update_all
    to_update = params['to_update']
    @results = Hash.new
    @result = @profile.update_soldiers('soldier' => to_update)
    
    respond_to do |format|
      format.html { render partial: 'profiles/changes' }
    end
  end
  
  def update
    @fighter = @profile.fighters.find(params[:id])
    
    respond_to do |format|
      if @fighter.update_attributes(params[:fighter])
        format.json { render json: @fighter }
      else
        format.json { render json: {errors: @fighter.errors.full_messages}, status: 422 }
      end
    end
  end
  
  def destroy
    @fighter = @profile.fighters.find(params[:id])
    
    @fighter.destroy

    respond_to do |format|
      format.html { redirect_to(profile_fighters_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      @profile = current_user.profiles.find(params[:profile_id])
    end
end
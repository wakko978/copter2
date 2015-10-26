class SpellsController < ApplicationController
  before_filter :load_profile
  
  def index
    @spells = @profile.spells.joins(:power).scoped
    if params[:filters]
      filters = params[:filters]
      if filters[:term]
        @spells = @spells.where(
          "UPPER(powers.name) LIKE ?","%#{filters[:term].upcase}%"
        )
      end
    end

    @spells = @spells.order(
      ((params[:c].nil?) ? "powers.e_attack" : params[:c]) + " " +
      ((params[:d] == 'up') ? "ASC" : "DESC")
    ).paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.json {
        json = {}
        @profile.spells.includes(:power).each do |r|
          json[r.power.name] = [r.owned.to_s, r.power.attack.to_s, r.power.defense.to_s]
        end
        render json: json
      }
    end
  end
  
  def new
    @spell = Spell.new
    @powers = Power.order(:name) - @profile.powers
  end
  
  def create
    @spell = @profile.spells.build(params[:spell])
    @powers = Power.order(:name) - @profile.powers
    
    respond_to do |format|
      if @spell.save
        format.html { redirect_to profile_spells_path(@profile) }
      else
        format.html { render :action => 'new'}
      end
    end
  end
  
  def update_all
    to_update = params['to_update']
    @results = Hash.new
    @result = @profile.update_magic('magic' => to_update)
    
    respond_to do |format|
      format.html { render partial: 'profiles/changes' }
    end
  end
  
  def update
    @spell = @profile.spells.find(params[:id])
    
    respond_to do |format|
      if @spell.update_attributes(params[:spell])
        format.json { render json: @spell }
      else
        format.json { render json: {errors: @spell.errors.full_messages}, status: 422 }
      end
    end
  end
  
  def get_info
    @power = Power.find(params[:power][:id])
    
    respond_to do |format|
      format.json { render json: { piercing: "Base: #{@power.piercing}", resistance: "Base: #{@power.resistance}" } }
    end
  end
  
  def destroy
    @spell = @profile.spells.find(params[:id])
    
    @spell.destroy

    respond_to do |format|
      format.html { redirect_to(profile_spells_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      @profile = current_user.profiles.find(params[:profile_id])
    end
end
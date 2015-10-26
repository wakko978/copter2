require 'will_paginate/array'
class RecruitsController < ApplicationController
  before_filter :load_profile
  
  def index
    @recruits = @profile.recruits.scoped
    if params[:filters]
      filters = params[:filters]
      if filters[:term]
        @recruits = @recruits.where(
          "UPPER(general.name) LIKE ?","%#{filters[:term].upcase}%"
        )
      end
    end

    @permitted_columns = ['name','level','attack','defense','e_attack','e_defense',
      'e_defense_with_bonus','e_attack_with_bonus','generals.general_type']

    params[:c] = @permitted_columns.include?(params[:c]) ? params[:c] : 'e_attack_with_bonus'
    
    @recruits.sort_by! do |a|
      if params[:c] == 'name'
        a.name
      elsif params[:c] == 'generals.general_type'
        [a.general.general_type, a.e_attack]
      elsif params[:c] == 'level'
        [a.level, a.e_attack]
      elsif params[:c] == 'attack' || params[:c] == 'defense'
        [a.send(params[:c]),a.name]
      elsif params[:c] == 'e_attack' || params[:c] == 'e_defense'
        [a.send(params[:c]), a.general.send("e_attack_with_bonus",@profile,a)]
      else
        [a.general.send(params[:c],@profile,a), a.e_attack]
      end
    end
    @recruits.reverse!
    if params[:d] == 'down'
      @recruits.reverse!
    end
    @recruits = @recruits.to_a.paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.json {
        json = {}
        @profile.recruits.each do |r|
          json[r.name] = "#{r.level.to_s}:#{r.promote_level.to_s}"
        end
        render json: json
      }
    end
  end
  
  def get_info
    @recruit = @profile.recruits.find(params[:recruit][:id])
    
    respond_to do |format|
      format.json { render json: { piercing: @recruit.piercing, resistance: @recruit.resistance } }
    end
  end
  
  def new
    @recruit = Recruit.new
    @generals = General.order(:name) - @profile.generals
  end
  
  def create
    @recruit = @profile.recruits.build(params[:recruit])
    @generals = General.order(:name) - @profile.generals
    
    respond_to do |format|
      if @recruit.save
        format.html { redirect_to profile_recruits_path(@profile) }
      else
        format.html { render :action => 'new'}
      end
    end
  end
  
  def update_all
    to_update = params['to_update']
    @results = Hash.new
    @result = @profile.update_generals('general' => to_update)
    
    respond_to do |format|
      format.html { render partial: 'profiles/changes' }
    end
  end
  
  def update
    @recruit = @profile.recruits.find(params[:id])
    
    respond_to do |format|
      if @recruit.update_attributes(params[:recruit])
        format.json { render json: {id: @recruit.id, attack: @recruit.attack,
          defense: @recruit.defense,
          e_attack: @recruit.e_attack, e_defense: @recruit.e_defense,
          attack_with_mods: @recruit.general.attack_with_mods(@profile,@recruit),
          defense_with_mods: @recruit.general.defense_with_mods(@profile,@recruit),
          e_attack_with_bonus: @recruit.general.e_attack_with_bonus(@profile,@recruit),
          e_defense_with_bonus: @recruit.general.e_defense_with_bonus(@profile,@recruit)} }
      else
        format.json { render json: {errors: @recruit.errors.full_messages}, status: 422 }
      end
    end
  end
  
  def destroy
    @recruit = @profile.recruits.find(params[:id])
    
    @recruit.destroy

    respond_to do |format|
      format.html { redirect_to(profile_recruits_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      # @profile = current_user.profiles.find(params[:profile_id])
      
      ## Possible to use eager loading to make downstream lookups faster?
      @profile = current_user.profiles.includes(:items,:weapons,:powers,:soldiers,:generals).find(params[:profile_id])
    end
end
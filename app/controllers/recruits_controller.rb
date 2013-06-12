require 'will_paginate/array'
class RecruitsController < ApplicationController
  before_filter :load_profile
  
  def index
    @recruits = @profile.recruits.joins(:general).scoped
    if params[:filters]
      filters = params[:filters]
      if filters[:term]
        @recruits = @recruits.where(
          "UPPER(general.name) LIKE ?","%#{filters[:term].upcase}%"
        )
      end
    end

    @permitted_columns = ['name','level','attack_with_mods','defense_with_mods',
      'e_defense_with_bonus','e_attack_with_bonus']

    params[:c] = @permitted_columns.include?(params[:c]) ? params[:c] : 'e_attack_with_bonus'
    
    @recruits.sort! do |a,b|
      if params[:d] == 'up'
        if params[:c] == 'name'
          a.send(params[:c]) <=> b.send(params[:c])
        elsif params[:c] == 'level'
          [a.send(params[:c]),b.general.send("e_attack_with_bonus",@profile,b)] <=> [b.send(params[:c]),a.general.send("e_attack_with_bonus",@profile,a)]
        elsif params[:c] == 'attack_with_mods' || params[:c] == 'defense_with_mods'
          [a.general.send(params[:c],@profile,a),b.general.send("e_attack_with_bonus",@profile,b)] <=> [b.general.send(params[:c],@profile,b),a.general.send("e_attack_with_bonus",@profile,a)]
        else
          [a.general.send(params[:c],@profile,a),b.general.send("attack_with_mods",@profile,b)] <=> [b.general.send(params[:c],@profile,b),a.general.send("attack_with_mods",@profile,a)]
        end
      else
        if params[:c] == 'name'
          b.send(params[:c]) <=> a.send(params[:c])
        elsif params[:c] == 'level'
          [b.send(params[:c]),b.general.send("e_attack_with_bonus",@profile,b)] <=> [a.send(params[:c]),a.general.send("e_attack_with_bonus",@profile,a)]
        elsif params[:c] == 'attack_with_mods' || params[:c] == 'defense_with_mods'
          [b.general.send(params[:c],@profile,b),b.general.send("e_attack_with_bonus",@profile,b)] <=> [a.general.send(params[:c],@profile,a),a.general.send("e_attack_with_bonus",@profile,a)]
        else
          [b.general.send(params[:c],@profile,b),b.general.send("attack_with_mods",@profile,b)] <=> [a.general.send(params[:c],@profile,a),a.general.send("attack_with_mods",@profile,a)]
        end
      end
    end
    @recruits = @recruits.to_a.paginate(:page => params[:page])

    respond_to do |format|
      format.html
    end
  end
  
  def new
    @recruit = Recruit.new
    @generals = General.order(:name) - @profile.generals
  end
  
  def create
    @recruit = @profile.recruits.build(params[:recruit])
    
    respond_to do |format|
      if @recruit.save!
        format.html { redirect_to profile_recruits_path(@profile) }
      else
        format.html { render :action => 'new'}
      end
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
      @profile = current_user.profiles.includes(:items,:weapons,:powers,:soldiers).find(params[:profile_id])
    end
end
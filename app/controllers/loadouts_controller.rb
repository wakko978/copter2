class LoadoutsController < ApplicationController
  before_filter :load_profile
  
  def index
    @loadouts = @profile.loadouts.scoped

    @permitted_columns = ['name','class_type','attack', 'defense','e_attack','e_defense']

    params[:c] = @permitted_columns.include?(params[:c]) ? params[:c] : 'e_attack'
    
    @loadouts.sort_by! do |a|
      if params[:c] == 'name'
        a.name
      elsif params[:c] == 'class_type'
        [a.class_type, a.e_attack]
      elsif params[:c] == 'attack'
        [a.attack, a.e_attack]
      elsif params[:c] == 'defense'
        [a.defense, a.e_defense]
      elsif params[:c] == 'e_attack' || params[:c] == 'e_defense'
        [a.send(params[:c])]
      else
        [a.e_attack]
      end
    end
    @loadouts.reverse!
    if params[:d] == 'down'
      @loadouts.reverse!
    end

    respond_to do |format|
      format.html
    end
  end
  
  def new
    @loadout = Loadout.new
    
    @generals = @profile.recruits.sort_by{|r| r.e_attack}.reverse
    @weapons = @profile.weapons.order('e_attack DESC')
    @shields = @profile.items.shield.order('e_attack DESC')
    @helmets = @profile.items.helmet.order('e_attack DESC')
    @armors = @profile.items.armor.order('e_attack DESC')
    @amulets = @profile.items.amulet.order('e_attack DESC')
    @gloves = @profile.items.glove.order('e_attack DESC')
    @boots = @profile.items.boot.order('e_attack DESC')
    @banners = @profile.items.banner.order('e_attack DESC')
    @powers = @profile.powers.order('e_attack DESC')
  end
  
  def edit
    @loadout = @profile.loadouts.find(params[:id])
    @generals = @profile.recruits.sort_by{|r| r.e_attack}.reverse
    @weapons = @profile.weapons.order('e_attack DESC')
    @shields = @profile.items.shield.order('e_attack DESC')
    @helmets = @profile.items.helmet.order('e_attack DESC')
    @armors = @profile.items.armor.order('e_attack DESC')
    @amulets = @profile.items.amulet.order('e_attack DESC')
    @gloves = @profile.items.glove.order('e_attack DESC')
    @boots = @profile.items.boot.order('e_attack DESC')
    @banners = @profile.items.banner.order('e_attack DESC')
    @powers = @profile.powers.order('e_attack DESC')
  end
  
  def create
    @loadout = @profile.loadouts.new(params[:loadout])
    @generals = @profile.recruits.sort_by{|r| r.e_attack}.reverse
    @weapons = @profile.weapons.order('e_attack DESC')
    @shields = @profile.items.shield.order('e_attack DESC')
    @helmets = @profile.items.helmet.order('e_attack DESC')
    @armors = @profile.items.armor.order('e_attack DESC')
    @amulets = @profile.items.amulet.order('e_attack DESC')
    @gloves = @profile.items.glove.order('e_attack DESC')
    @boots = @profile.items.boot.order('e_attack DESC')
    @banners = @profile.items.banner.order('e_attack DESC')
    @powers = @profile.powers.order('e_attack DESC')
    
    respond_to do |format|
      if @loadout.save
        format.html { redirect_to profile_loadouts_path(@profile) }
      else
        format.html { render :action => 'new'}
      end
    end
  end
  
  def update
    @loadout = @profile.loadouts.find(params[:id])
    @generals = @profile.recruits.sort_by{|r| r.e_attack}.reverse
    @weapons = @profile.weapons.order('e_attack DESC')
    @shields = @profile.items.shield.order('e_attack DESC')
    @helmets = @profile.items.helmet.order('e_attack DESC')
    @armors = @profile.items.armor.order('e_attack DESC')
    @amulets = @profile.items.amulet.order('e_attack DESC')
    @gloves = @profile.items.glove.order('e_attack DESC')
    @boots = @profile.items.boot.order('e_attack DESC')
    @banners = @profile.items.banner.order('e_attack DESC')
    @powers = @profile.powers.order('e_attack DESC')
    
    respond_to do |format|
      if @loadout.update_attributes(params[:loadout])
        format.html { redirect_to profile_loadouts_path(@profile) }
      else
        format.html { render :action => 'edit' }
      end
    end
  end
  
  def destroy
    @loadout = @profile.loadouts.find(params[:id])
    
    @loadout.destroy

    respond_to do |format|
      format.html { redirect_to(profile_loadouts_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      # @profile = current_user.profiles.find(params[:profile_id])
      
      ## Possible to use eager loading to make downstream lookups faster?
      @profile = current_user.profiles.includes(:items,:weapons,:powers,:generals).find(params[:profile_id])
    end
end
class AccessoriesController < ApplicationController
  before_filter :load_profile
  
  def index
    permitted_scopes = ['amulet','armor','boot','helmet','glove','shield']
    params[:item_type] = permitted_scopes.include?(params[:item_type]) ? params[:item_type] : 'amulet'
    
    @accessories = @profile.accessories.joins(:item).send(params[:item_type]).scoped
    if params[:filters]
      filters = params[:filters]
      if filters[:term]
        @accessories = @accessories.where(
          "UPPER(items.name) LIKE ?","%#{filters[:term].upcase}%"
        )
      end
    end

    permitted_columns = ['name','attack','defense','e_attack','e_defense','base_cost','upkeep','div_power']
    params[:c] = permitted_columns.include?(params[:c]) ? params[:c] : 'e_attack'

    @accessories = @accessories.order(
      ((params[:c].nil?) ? "items.e_attack" : params[:c]) + " " +
      ((params[:d] == 'up') ? "ASC" : "DESC")
    ).paginate(:page => params[:page])

    respond_to do |format|
      format.html
    end
  end
  
  def get_info
    @item = Item.find(params[:item][:id])
    
    respond_to do |format|
      format.json { render json: { piercing: "Base: #{@item.piercing}", resistance: "Base: #{@item.resistance}" } }
    end
  end
  
  def new
    permitted_scopes = ['amulet','armor','boot','helmet','glove','shield']
    
    params[:item_type] = permitted_scopes.include?(params[:item_type]) ? params[:item_type] : 'amulet'
    
    @accessory = Accessory.new
    @items = Item.send(params[:item_type].to_sym).order(:name) - @profile.items.send(params[:item_type].to_sym)
  end
  
  def create
    @accessory = @profile.accessories.build(params[:accessory])
    @items = Item.send(params[:item_type].to_sym).order(:name) - @profile.items.send(params[:item_type].to_sym)
    
    respond_to do |format|
      if @accessory.save
        format.html { redirect_to profile_accessories_path(@profile) }
      else
        format.html { render :action => 'new'}
      end
    end
  end
  
  def update
    @accessory = @profile.accessories.find(params[:id])
    
    respond_to do |format|
      if @accessory.update_attributes(params[:accessory])
        format.json { render json: @accessory }
      else
        format.json { render json: {errors: @accessory.errors.full_messages}, status: 422 }
      end
    end
  end
  
  def destroy
    @accessory = @profile.accessories.find(params[:id])
    
    @accessory.destroy

    respond_to do |format|
      format.html { redirect_to(profile_accessories_path(@profile)) }
    end
  end
  
  protected
    def load_profile
      @profile = current_user.profiles.find(params[:profile_id])
    end
end
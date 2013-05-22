module Admin
  class WeaponsController < BaseController
    def index
      @weapons = Weapon.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @weapon = Weapon.new
    end
    
    def edit
      @weapon = Weapon.find(params[:id])
    end

    def create
      @weapon = Weapon.new(params[:weapon])

      respond_to do |format|
        if @weapon.save
          flash[:notice] = 'Weapon was successfully created.'
          format.html { redirect_to(admin_weapons_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @weapon = Weapon.find(params[:id])

      respond_to do |format|
        if @weapon.update_attributes(params[:weapon])
          flash[:notice] = 'Weapon was successfully updated.'
          format.html { redirect_to(admin_weapons_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @weapon = Weapon.find(params[:id])
      @weapon.destroy

      respond_to do |format|
        format.html { redirect_to(admin_weapons_url) }
      end
    end
  end
end
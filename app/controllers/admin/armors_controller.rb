module Admin
  class ArmorsController < BaseController
    def index
      @armors = Item::Armor.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @armor = Item::Armor.new
    end
    
    def edit
      @armor = Item::Armor.find(params[:id])
    end

    def create
      @armor = Item::Armor.new(params[:armor])

      respond_to do |format|
        if @armor.save
          flash[:notice] = 'Armor was successfully created.'
          format.html { redirect_to(admin_armors_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @armor = Item::Armor.find(params[:id])

      respond_to do |format|
        if @armor.update_attributes(params[:armor])
          flash[:notice] = 'Armor was successfully updated.'
          format.html { redirect_to(admin_armors_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @armor = Item::Armor.find(params[:id])
      @armor.destroy

      respond_to do |format|
        format.html { redirect_to(admin_armors_url) }
      end
    end
  end
end
module Admin
  class ShieldsController < BaseController
    def index
      @shields = Item::Shield.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @shield = Item::Shield.new
    end
    
    def edit
      @shield = Item::Shield.find(params[:id])
    end

    def create
      @shield = Item::Shield.new(params[:shield])

      respond_to do |format|
        if @shield.save
          flash[:notice] = 'Shield was successfully created.'
          format.html { redirect_to(admin_shields_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @shield = Item::Shield.find(params[:id])

      respond_to do |format|
        if @shield.update_attributes(params[:shield])
          flash[:notice] = 'Shield was successfully updated.'
          format.html { redirect_to(admin_shields_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @shield = Item::Shield.find(params[:id])
      @shield.destroy

      respond_to do |format|
        format.html { redirect_to(admin_shields_url) }
      end
    end
  end
end
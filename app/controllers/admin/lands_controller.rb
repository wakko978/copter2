module Admin
  class LandsController < BaseController
    def index
      @lands = Land.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @land = Land.new
    end
    
    def edit
      @land = Land.find(params[:id])
    end

    def create
      @land = Land.new(params[:land])

      respond_to do |format|
        if @land.save
          flash[:notice] = 'Land was successfully created.'
          format.html { redirect_to(admin_lands_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @land = Land.find(params[:id])

      respond_to do |format|
        if @land.update_attributes(params[:land])
          flash[:notice] = 'Land was successfully updated.'
          format.html { redirect_to(admin_lands_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @land = Land.find(params[:id])
      @land.destroy

      respond_to do |format|
        format.html { redirect_to(admin_lands_url) }
      end
    end
  end
end
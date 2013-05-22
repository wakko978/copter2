module Admin
  class BootsController < BaseController
    def index
      @boots = Item::Boot.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @boot = Item::Boot.new
    end
    
    def edit
      @boot = Item::Boot.find(params[:id])
    end

    def create
      @boot = Item::Boot.new(params[:boot])

      respond_to do |format|
        if @boot.save
          flash[:notice] = 'Boot was successfully created.'
          format.html { redirect_to(admin_boots_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @boot = Item::Boot.find(params[:id])

      respond_to do |format|
        if @boot.update_attributes(params[:boot])
          flash[:notice] = 'Boot was successfully updated.'
          format.html { redirect_to(admin_boots_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @boot = Item::Boot.find(params[:id])
      @boot.destroy

      respond_to do |format|
        format.html { redirect_to(admin_boots_url) }
      end
    end
  end
end
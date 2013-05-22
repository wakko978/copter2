module Admin
  class AmuletsController < BaseController
    def index
      @amulets = Item::Amulet.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @amulet = Item::Amulet.new
    end
    
    def edit
      @amulet = Item::Amulet.find(params[:id])
    end

    def create
      @amulet = Item::Amulet.new(params[:amulet])

      respond_to do |format|
        if @amulet.save
          flash[:notice] = 'Amulet was successfully created.'
          format.html { redirect_to(admin_amulets_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @amulet = Item::Amulet.find(params[:id])

      respond_to do |format|
        if @amulet.update_attributes(params[:amulet])
          flash[:notice] = 'Amulet was successfully updated.'
          format.html { redirect_to(admin_amulets_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @amulet = Item::Amulet.find(params[:id])
      @amulet.destroy

      respond_to do |format|
        format.html { redirect_to(admin_amulets_url) }
      end
    end
  end
end
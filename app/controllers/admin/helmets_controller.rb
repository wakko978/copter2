module Admin
  class HelmetsController < BaseController
    def index
      @helmets = Item::Helmet.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @helmet = Item::Helmet.new
    end
    
    def edit
      @helmet = Item::Helmet.find(params[:id])
    end

    def create
      @helmet = Item::Helmet.new(params[:helmet])

      respond_to do |format|
        if @helmet.save
          flash[:notice] = 'Helmet was successfully created.'
          format.html { redirect_to(admin_helmets_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @helmet = Item::Helmet.find(params[:id])

      respond_to do |format|
        if @helmet.update_attributes(params[:helmet])
          flash[:notice] = 'Helmet was successfully updated.'
          format.html { redirect_to(admin_helmets_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @helmet = Item::Helmet.find(params[:id])
      @helmet.destroy

      respond_to do |format|
        format.html { redirect_to(admin_helmets_url) }
      end
    end
  end
end
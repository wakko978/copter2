module Admin
  class BannersController < BaseController
    def index
      @banners = Item::Banner.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @banner = Item::Banner.new
    end
    
    def edit
      @banner = Item::Banner.find(params[:id])
    end

    def create
      @banner = Item::Banner.new(params[:banner])

      respond_to do |format|
        if @banner.save
          flash[:notice] = 'Banner was successfully created.'
          format.html { redirect_to(admin_banners_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @banner = Item::Banner.find(params[:id])

      respond_to do |format|
        if @banner.update_attributes(params[:banner])
          flash[:notice] = 'Banner was successfully updated.'
          format.html { redirect_to(admin_banners_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @banner = Item::Banner.find(params[:id])
      @banner.destroy

      respond_to do |format|
        format.html { redirect_to(admin_banners_url) }
      end
    end
  end
end
module Admin
  class GeneralsController < BaseController
    def index
      @generals = General.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @general = General.new
    end
    
    def edit
      @general = General.find(params[:id])
    end

    def create
      @general = General.new(params[:general])

      respond_to do |format|
        if @general.save
          flash[:notice] = 'General was successfully created.'
          format.html { redirect_to(admin_generals_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @general = General.find(params[:id])

      respond_to do |format|
        if @general.update_attributes(params[:general])
          flash[:notice] = 'General was successfully updated.'
          format.html { redirect_to(admin_generals_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @general = General.find(params[:id])
      @general.destroy

      respond_to do |format|
        format.html { redirect_to(admin_generals_url) }
      end
    end
  end
end
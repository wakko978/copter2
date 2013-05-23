module Admin
  class OthersController < BaseController
    def index
      @others = Other.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @other = Other.new
    end
    
    def edit
      @other = Other.find(params[:id])
    end

    def create
      @other = Other.new(params[:other])

      respond_to do |format|
        if @other.save
          flash[:notice] = 'Miscellaneous item was successfully created.'
          format.html { redirect_to(admin_others_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @other = Other.find(params[:id])

      respond_to do |format|
        if @other.update_attributes(params[:other])
          flash[:notice] = 'Miscellaneous item was successfully updated.'
          format.html { redirect_to(admin_others_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @other = Other.find(params[:id])
      @other.destroy

      respond_to do |format|
        format.html { redirect_to(admin_others_url) }
      end
    end
  end
end
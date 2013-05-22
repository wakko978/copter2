module Admin
  class PowersController < BaseController
    def index
      @powers = Power.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @power = Power.new
    end
    
    def edit
      @power = Power.find(params[:id])
    end

    def create
      @power = Power.new(params[:power])

      respond_to do |format|
        if @power.save
          flash[:notice] = 'Magic was successfully created.'
          format.html { redirect_to(admin_powers_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @power = Power.find(params[:id])

      respond_to do |format|
        if @power.update_attributes(params[:power])
          flash[:notice] = 'Magic was successfully updated.'
          format.html { redirect_to(admin_powers_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @power = Power.find(params[:id])
      @power.destroy

      respond_to do |format|
        format.html { redirect_to(admin_powers_url) }
      end
    end
  end
end
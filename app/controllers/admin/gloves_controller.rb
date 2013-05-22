module Admin
  class GlovesController < BaseController
    def index
      @gloves = Item::Glove.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @glove = Item::Glove.new
    end
    
    def edit
      @glove = Item::Glove.find(params[:id])
    end

    def create
      @glove = Item::Glove.new(params[:glove])

      respond_to do |format|
        if @glove.save
          flash[:notice] = 'Glove was successfully created.'
          format.html { redirect_to(admin_gloves_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @glove = Item::Glove.find(params[:id])

      respond_to do |format|
        if @glove.update_attributes(params[:glove])
          flash[:notice] = 'Glove was successfully updated.'
          format.html { redirect_to(admin_gloves_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @glove = Item::Glove.find(params[:id])
      @glove.destroy

      respond_to do |format|
        format.html { redirect_to(admin_gloves_url) }
      end
    end
  end
end
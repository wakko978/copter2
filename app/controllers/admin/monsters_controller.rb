module Admin
  class MonstersController < BaseController
    def index
      @monsters = Monster.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @monster = Monster.new
    end
    
    def edit
      @monster = Monster.find(params[:id])
    end

    def create
      @monster = Monster.new(params[:monster])

      respond_to do |format|
        if @monster.save
          flash[:notice] = 'Monster was successfully created.'
          format.html { redirect_to(admin_monsters_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @monster = Monster.find(params[:id])

      respond_to do |format|
        if @monster.update_attributes(params[:monster])
          flash[:notice] = 'Monster was successfully updated.'
          format.html { redirect_to(admin_monsters_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @monster = Monster.find(params[:id])
      @monster.destroy

      respond_to do |format|
        format.html { redirect_to(admin_monsters_url) }
      end
    end
  end
end
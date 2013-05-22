module Admin
  class SoldiersController < BaseController
    def index
      @soldiers = Soldier.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end

    def new
      @soldier = Soldier.new
    end
    
    def edit
      @soldier = Soldier.find(params[:id])
    end

    def create
      @soldier = Soldier.new(params[:soldier])

      respond_to do |format|
        if @soldier.save
          flash[:notice] = 'Soldier was successfully created.'
          format.html { redirect_to(admin_soldiers_path) }
        else
          format.html { render :action => "new" }
        end
      end
    end

    def update
      @soldier = Soldier.find(params[:id])

      respond_to do |format|
        if @soldier.update_attributes(params[:soldier])
          flash[:notice] = 'Soldier was successfully updated.'
          format.html { redirect_to(admin_soldiers_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @soldier = Soldier.find(params[:id])
      @soldier.destroy

      respond_to do |format|
        format.html { redirect_to(admin_soldiers_url) }
      end
    end
  end
end
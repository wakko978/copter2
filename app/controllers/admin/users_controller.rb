module Admin
  class UsersController < BaseController
    def index
      @users = User.search(:c => params[:c], :d => params[:d], :page => params[:page])
    end
    
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.update_attributes(params[:power])
          flash[:notice] = 'User was successfully updated.'
          format.html { redirect_to(admin_users_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to(admin_users_url) }
      end
    end
    
    def become
      return unless current_user.is_admin?
      sign_in(:user, User.find(params[:id]))
      redirect_to root_url # or user_root_url
    end
  end
end
module Admin
  class MessagesController < BaseController
    def edit
      @message = Message.first
    end

    def update
      @message = Message.first

      respond_to do |format|
        if @message.update_attributes(params[:message])
          flash[:notice] = 'Message was successfully updated.'
          format.html { redirect_to(root_path) }
        else
          format.html { render :action => "edit" }
        end
      end
    end
    
    protected

      def check_admin_manager
        ## Omitting Manager Role
        unless current_user.is_admin?
          flash[:alert] = "Not Authorized!"
          redirect_to root_path
          return
        end
      end
  end
end
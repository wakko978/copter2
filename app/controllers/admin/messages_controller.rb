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
  end
end
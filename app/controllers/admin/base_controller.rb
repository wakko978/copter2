module Admin
  class BaseController < ApplicationController
    before_filter :check_admin
  
    def index
    end
  
    protected

      def check_admin
        unless current_user.is_admin?
          flash[:error] = "Not Authorized!"
          redirect_to root_path
          return
        end
      end
  end
end